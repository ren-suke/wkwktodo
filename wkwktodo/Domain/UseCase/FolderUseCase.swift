//
//  FolderUseCase.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/09.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

protocol FolderUseCaseProtocol {
//    func getFolders() -> Observable<[Folder]>
}

class FolderUseCaseMock: FolderUseCaseProtocol {
    func getFolders() -> Observable<[Folder]> {
        return Observable<[Folder]>.create { observer in
            observer.onNext([Folder(id: "01019319", title: "AAA", primaryColor: .red, allTaskCount: 10, completedTaskCount: 1, type: .original), Folder(id: "21o41-", title: "today", primaryColor: .gold, allTaskCount: 1023, completedTaskCount: 1, type: .today)])
            return Disposables.create()
        }
    }
}

class FolderUseCase: FolderUseCaseProtocol {
//    func getFolders() -> Observable<[Folder]> {
//        return FolderRepository
//            .getFolderObjects()
//            .flatMap { folderObjects -> Observable<[Folder]> in
//                return .just(folderObjects
//                    .compactMap { folderObject -> Folder in
//                        return Folder.init(
//                            id: folderObject.id,
//                            title: folderObject.title,
//                            primaryColor: folderObject.primaryColor,
//                            allTaskCount: folderObject.tasks.count,
//                            completedTaskCount: folderObject.tasks.filter { $0.isCompleted }.count,
//                            type: folderObject.type)
//                    })
//            }
//    }
}

