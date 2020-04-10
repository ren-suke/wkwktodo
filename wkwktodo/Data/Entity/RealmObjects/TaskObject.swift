//
//  Task.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/14.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

class TaskObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var deadline: Date?
    @objc dynamic var isCompleted: Bool = false
    @objc dynamic var completedDate: Date?
    @objc dynamic var wp: Int = 0
    @objc dynamic var order: Int = 0
    @objc dynamic var indentationLevel: Int = 0
    @objc dynamic var folder: FolderObject?

    override static func primaryKey() -> String? {
        return "id"
        
    }
}
