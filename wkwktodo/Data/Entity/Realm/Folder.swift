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
    @objc private dynamic var typeRawValue: String = ""
    var type: FolderType {
        get { return FolderType(rawValue: typeRawValue) ?? .original}
        set { typeRawValue = newValue.rawValue }
    }
    @objc private dynamic var detailTypeRawValue: String = ""
    var detailType: FolderDetailType {
        get { return FolderDetailType(rawValue: detailTypeRawValue) ?? .unknown }
        set { detailTypeRawValue = newValue.rawValue }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

enum FolderType: String {
    case standard, original
}

enum FolderDetailType: String {
    case today, all, unknown
}
