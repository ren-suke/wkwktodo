//
//  StandardFolder.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/11.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation

struct StandardFolder {
    let type: StandardFolderType
    let title: String
    let primaryColor: FolderPrimaryColorType
    let allTaskCount: Int
}

enum StandardFolderType {
    case today, all
}
