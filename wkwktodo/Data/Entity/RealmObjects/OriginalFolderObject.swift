//
//  OriginalFolderObject.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/10.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

class OriginalFolderObject: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var title: String = ""
    @objc private dynamic var primaryColorRawValue: String = ""
    var primaryColor: FolderPrimaryColorType {
        get { return FolderPrimaryColorType(rawValue: primaryColorRawValue) ?? .red }
        set { primaryColorRawValue = newValue.rawValue }
    }
    let tasks = LinkingObjects(fromType: TaskObject.self, property: "folder")
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
