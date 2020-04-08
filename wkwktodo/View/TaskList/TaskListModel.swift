//
//  TaskListModel.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/26.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

class TaskListModel {
    func addTask(title: String) -> Observable<Void> {
        return TaskDataStore.addTask(title: title)
    }
    
    func getTasks(taskRealmQueryType: TaskRealmQueryType?, folderId: Int?) -> Observable<[Task]> {
        var query: String = ""
        if let _folderId = folderId {
            query += "folder.id == '\(_folderId)'"
        }
        if let _taskRealmQueryType = taskRealmQueryType {
            query += _taskRealmQueryType.getQueryString()
        }
        return TaskDataStore.getTasks(query: NSPredicate(format: query, argumentArray: nil))
    }
    
    func getzEmotgionValue(text: String) -> Observable<Float> {
        NatureAPIClient.getEmotgionValue(with: text)
    }
}
