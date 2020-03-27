//
//  HomeModel.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/21.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import RxSwift

protocol HomeModelProtocol {
    func getFolders() -> Observable<[Folder]>
}

final class HomeModel: HomeModelProtocol {
    func getFolders() -> Observable<[Folder]> {
        return FolderDataStore.getFolders()
    }
}
