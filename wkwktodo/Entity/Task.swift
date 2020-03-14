//
//  Task.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/14.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var deadline: Date = Date()
    @objc dynamic var isCompleted: Bool = false
    @objc dynamic var completedDate: Date = Date()
    @objc dynamic var wp: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
