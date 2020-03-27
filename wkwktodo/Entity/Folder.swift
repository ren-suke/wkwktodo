//
//  List.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/14.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

class Folder: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc private dynamic var primaryColorRawValue: String = ""
    var primaryColor: FolderPrimaryColorType {
        get { return FolderPrimaryColorType(rawValue: primaryColorRawValue) ?? .red }
        set { primaryColorRawValue = newValue.rawValue }
    }
    let tasks = List<Task>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
