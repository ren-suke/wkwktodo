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
    private var wp: Observable<Int>
    private var standardFolders: Observable<[StandardFolder]>
    private var folders: Observable<[Folder]>
    var homeCollectionViewType: Driver<HomeCollectionViewType>
    
    init(homeUseCase: HomeUseCaseProtocol = HomeUseCase()) {
        wp = homeUseCase.getWP()
        standardFolders = homeUseCase.getStandardFolders()
        folders = homeUseCase.getFolders()
        
        homeCollectionViewType = Observable
            .combineLatest(wp, standardFolders, folders)
            .flatMap { _wp, _standardFolders, _folders -> Observable<HomeCollectionViewType> in
                print(_wp, _standardFolders, _folders)
                return .just(HomeCollectionViewType(wp: _wp, standardFolders: _standardFolders, folders: _folders))
            }
            .asDriver(onErrorJustReturn: HomeCollectionViewType(wp: 0, standardFolders: [], folders: []))
    }
}
