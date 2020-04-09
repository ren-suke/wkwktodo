//
//  FolderRepository.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/09.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

protocol FolderRepositoryProtocol {
    static func getFolderObjects() -> Observable<[FolderObject]>
}

struct FolderRepository: FolderRepositoryProtocol {
    static func getFolderObjects() -> Observable<[FolderObject]> {
        return FolderDataStore.getFolderObjects()
    }
}
