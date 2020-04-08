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
}
