//
//  List.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/14.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

class List: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc private dynamic var primaryColorRawValue: String = ""
    var primaryColor: ListPrimaryColors {
        get { return ListPrimaryColors(rawValue: primaryColorRawValue) ?? .red }
        set { primaryColorRawValue = newValue.rawValue }
    }
    @objc dynamic var tasks: [Task] = []
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

enum ListPrimaryColors: String {
    case red
    case orange
    case yellow
    case green
    case lightBlue
    case blue
    case bluePurple
    case rose
    case purple
    case gold
    case silver
    case pink
}
