//
//  Folder.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/09.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation

struct Folder {
    let id: String
    let title: String
    let primaryColor: FolderPrimaryColorType
    let allTaskCount: Int
    let completedTaskCount: Int
    let type: FolderType
    let detailType: FolderDetailType?
}
