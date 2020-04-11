//
//  TaskRepository.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/11.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

class TaskRepository {
    static func get() -> Observable<[TaskObject]> {
        return TaskDataStore.getTasks()
    }
}
