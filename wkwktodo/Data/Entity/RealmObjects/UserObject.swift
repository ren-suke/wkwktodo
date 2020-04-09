//
//  User.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/14.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

class UserObject: Object {
    @objc dynamic var totalWP: Int = 0
    @objc dynamic var lastLoginDate: Date = Date()
    @objc dynamic var continuousLoginDays: Int = 0
    @objc dynamic var totalLoginDays: Int = 0
    @objc dynamic var totalCompleteTasks: Int = 0
    let tasks = LinkingObjects(fromType: TaskObject.self, property: "folder")
}
