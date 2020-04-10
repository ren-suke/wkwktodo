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
    let folder: Folder?
}

class TaskListViewModel {
//    private(set) var tasks: Driver<[Task]> = .empty()
    
    init(input: TaskListViewModelInput) {
        
    }
}
class ErrorClass: Error {}
