//
//  Material.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/14.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

class Material: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var letterBody: String = ""
    @objc private dynamic var typeRawValue: String = ""
    var type: MaterialType {
        get { return MaterialType(rawValue: typeRawValue) ?? .undefined }
        set { typeRawValue = newValue.rawValue }
    }
    @objc dynamic var previewImageData: Data = Data()
    @objc dynamic var data: Data = Data()
    @objc dynamic var terms: Terms? = Terms()
    @objc dynamic var isValid: Bool = true
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

enum MaterialType: String {
    case voice
    case wallpaper
    case liveWallpaper
    case movie
    case undefined
}
