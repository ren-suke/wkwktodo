//
//  HomeViewModel.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/21.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct HomeViewModelInput {
    let collectionButtonTapped: Observable<Void>
    let editButtonTapped: Observable<Void>
    let todaysTaskButtonTapped: Observable<Void>
    let completedTaskButtonTapped: Observable<Void>
    let listTableViewCellTapped: Observable<Int>
    let addFolderButtonTapped: Observable<Void>
    let tableHeaderViewDisposeBag: DisposeBag
}

final class HomeViewModel {
    private let foldersRelay: BehaviorRelay<[FolderCellType]> = BehaviorRelay<[FolderCellType]>(value: [])
    var folders: Driver<[FolderCellType]> {
        return foldersRelay.asDriver()
    }
    
    private let totalWPRelay: BehaviorRelay<String> = .init(value: "")
    var totalWP: Driver<String> {
        return totalWPRelay.asDriver()
    }
    
    private let todaysTaskList: Observable<[Task]>
    var todaysTaskCount: Driver<String> {
        return todaysTaskList
            .flatMap { todaysTaskList -> Observable<Int> in
                return .just(todaysTaskList.count)
            }
            .map { String($0) }
            .asDriver(onErrorJustReturn: "")
    }
    
    private let completedTaskList: Observable<[Task]>
    var completedTaskCount: Driver<String> {
        return completedTaskList
            .flatMap { completedTaskList -> Observable<Int> in
                return .just(completedTaskList.count)
            }
            .map { String($0) }
            .asDriver(onErrorJustReturn: "")
    }
    
    let errorMessageSubject: PublishSubject<String> = .init()
    private let disposeBag: DisposeBag = .init()
    
    let showTaskList: PublishSubject<(TaskRealmQueryType?, Int?)> = .init()
    
    init(input: HomeViewModelInput,
         model: HomeModelProtocol = HomeModel()) {
        let foldersEvent = model.getFolders()
        todaysTaskList = foldersEvent
            .flatMap { folders -> Observable<[Task]> in
                var todayTasks: [Task] = []
                for folder in folders {
                    let _tasks = folder.tasks
                    for task in _tasks {
                        guard let deadline = task.deadline else { break }
                        if deadline.isToday {
                            todayTasks.append(task)
                        }
                    }
                }
                return .just(todayTasks)
            }
        
        completedTaskList = foldersEvent
            .flatMap { folders -> Observable<[Task]> in
                var completedTasks: [Task] = []
                for folder in folders {
                    let _tasks = folder.tasks
                    for task in _tasks {
                        if task.isCompleted {
                            completedTasks.append(task)
                        }
                    }
                }
                return .just(completedTasks)
            }
        
        foldersEvent.flatMap { folders -> Observable<[FolderCellType]> in
            var folderCellTypes: [FolderCellType] = []
            for folder in folders {
                let _tasks = folder.tasks
                folderCellTypes.append(FolderCellType(id: folder.id,
                               primaryColor: folder.primaryColor,
                               title: folder.title,
                               progress: "\(_tasks.filter { $0.isCompleted }.count)/\(_tasks.count)")
                )
            }
            return .just(folderCellTypes)
        }
        .subscribe(onNext: { folders in
            self.foldersRelay.accept(folders)
        }, onError: { error in
            print(error)
            self.errorMessageSubject.onNext("error")
        })
        .disposed(by: disposeBag)
        
        input.todaysTaskButtonTapped
            .subscribe(onNext: { [weak self] _ in
                print("--------- view model todaysTaskButtonTapped ")
                self?.showTaskList.onNext((.today, nil))
            })
            .disposed(by: input.tableHeaderViewDisposeBag)
        
        input.completedTaskButtonTapped
            .subscribe({ [weak self] _ in
                self?.showTaskList.onNext((.completed, nil))
            })
            .disposed(by: input.tableHeaderViewDisposeBag)
        
        input.listTableViewCellTapped
            .subscribe(onNext: { [weak self] id in
                self?.showTaskList.onNext((nil, id))
            })
            .disposed(by: disposeBag)
    }
}
