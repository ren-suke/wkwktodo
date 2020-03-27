//
//  TaskListViewModel.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/26.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct TaskListViewModelInput {
    let addTaskButtonTapped: Observable<Void>
    let taskCellCheckBoxClicked: Observable<IndexPath>
    let taskRealmQueryType: TaskRealmQueryType?
    let folderId: Int?
}

class TaskListViewModel {
    private let tasksRelay: BehaviorRelay<[Task]> = .init(value: [])
    var tasks: Driver<[Task]> {
        return tasksRelay.asDriver()
    }
    
    let addTaskSubject: PublishSubject<String> = .init()
    
    private let showResultAlert: PublishSubject<String> = .init()
    private let showKeyboard: PublishSubject<Void> = .init()
    private let showErrorAlert: PublishSubject<String> = .init()
    private let disposeBag: DisposeBag = .init()
    
    init(input: TaskListViewModelInput, model: TaskListModel = TaskListModel()) {
        input.addTaskButtonTapped
            .subscribe({ [weak self] _ in
                guard let me = self else { return }
                me.showKeyboard.onNext(())
            })
            .disposed(by: disposeBag)
        
        addTaskSubject
            .flatMap { title -> Observable<Void> in
                return model.addTask(title: title)
            }
            .subscribe(onError: { [weak self] error in
                guard let me = self else { return }
                print(error)
                me.showErrorAlert.onNext("error")
            })
            .disposed(by: disposeBag)
        
        input.taskCellCheckBoxClicked
            .flatMap { [weak self] indexPath -> Observable<Float> in
                guard let me = self else { return .error(ErrorClass())  }
                let task = me.tasksRelay.value[indexPath.row]
                return model.getzEmotgionValue(text: task.title)
            }
            .map { String(Int($0)) }
            .subscribe(onNext: { str in
                self.showResultAlert.onNext(str)
            })
            .disposed(by: disposeBag)
    }
}
class ErrorClass: Error{}
