//
//  HomeViewModel.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/21.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct HomeViewModelInput {
    let collectionButtonTapped: Observable<Void>
    let editButtonTapped: Observable<Void>
    let todaysTaskButtonTapped: Observable<Void>
    let completedTaskButtonTapped: Observable<Void>
    let listTableViewCellTapped: Observable<Int>
    let addFolderButtonTapped: Observable<Void>
    let tableHeaderViewDisposeBag: DisposeBag
}

final class HomeViewModel {
    private var wp: PublishRelay<Int> = .init()
    private var standardFolders: PublishRelay<[StandardFolder]> = .init()
    private var folders: PublishRelay<[Folder]> = .init()
    var homeCollectionViewType: Observable<HomeCollectionViewType> {
        return Observable
            .combineLatest(wp, standardFolders, folders)
            .flatMap { _wp, _standardFolders, _folders -> Observable<HomeCollectionViewType> in
                return .just(HomeCollectionViewType(wp: _wp, standardFolders: _standardFolders, folders: _folders))
            }
    }
    
    init(input: HomeViewModelInput, folderUseCase: FolderUseCase) {
        
    }
}
