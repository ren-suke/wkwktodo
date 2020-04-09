//
//  TaskDataSource.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/26.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift
import RxRealm
import RxSwift

class TaskObjectDataStore {
    static func getTasks(query: NSPredicate) -> Observable<[TaskObject]> {
        do {
            let realm = try Realm()
            let tasks = realm.objects(TaskObject.self).filter(query)
            return Observable.array(from: tasks)
        } catch {
            return .error(error)
        }
    }
    
    static func addTask(title: String) -> Observable<Void> {
        do {
            let realm = try Realm()
            try realm.write {
                let task: TaskObject = .init()
                task.title = title
                realm.add(task)
            }
            return .just(())
        } catch {
            return .error(error)
        }
    }
    
    static func changeTaskCompleted(taskID: Int, newValue: Bool) -> Observable<Void> {
        do {
            let realm = try Realm()
            let changeObject = realm.object(ofType: TaskObject.self, forPrimaryKey: taskID)
            try realm.write {
                changeObject?.isCompleted = newValue
            }
            return .just(())
        } catch {
            return .error(error)
        }
    }
}

enum TaskRealmQueryType {
    case today, completed
    
    func getQueryString() -> String {
        switch self {
        case .today:
            return "deadline = '\(Date())'"
        case .completed:
            return "isCompleted = 'true'"
        }
    }
}
