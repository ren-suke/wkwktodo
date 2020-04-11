//
//  HomeUseCase.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/11.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeUseCaseProtocol {
    func getWP() -> Observable<Int>
    func getStandardFolders() -> Observable<[StandardFolder]>
    func getFolders() -> Observable<[Folder]>
}

class HomeUseCase: HomeUseCaseProtocol {
    func getWP() -> Observable<Int> {
        UserRepository.get()
            .flatMap { userObject -> Observable<Int> in
                return .just(userObject.totalWP)
            }
    }
    
    func getStandardFolders() -> Observable<[StandardFolder]> {
        return TaskRepository.get()
            .flatMap { taskObjects -> Observable<[StandardFolder]> in
                return .just([
                    StandardFolder(type: .today, title: "today", primaryColor: .blue, allTaskCount: taskObjects.filter { $0.deadline?.isToday ?? false }.count),
                    StandardFolder(type: .all, title: "all", primaryColor: .red, allTaskCount: taskObjects.count)
                ])
            }
    }
    
    func getFolders() -> Observable<[Folder]> {
        return FolderRepository
            .getFolderObjects()
            .flatMap { folderObjects -> Observable<[Folder]> in
                return .just(
                    folderObjects.compactMap { folderObject -> Folder in
                        return Folder(
                            id: folderObject.id,
                            title: folderObject.title,
                            primaryColor: folderObject.primaryColor,
                            allTaskCount: folderObject.tasks.count,
                            completedTaskCount: folderObject.tasks.filter { $0.isCompleted }.count,
                            order: folderObject.order)
                    }
                )
            }
    }
}
