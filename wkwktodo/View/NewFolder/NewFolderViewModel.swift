//
//  NewListViewModel.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/24.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class NewFolderViewModel {
    
    let listPrimaryColorRelay: PublishRelay<FolderPrimaryColorType?> = PublishRelay<FolderPrimaryColorType?>()
    
    init(listTitle: Observable<String?>, doneButtonTapped: Observable<Void>) {
        doneButtonTapped
            .withLatestFrom(Observable.combineLatest(listTitle, listPrimaryColorRelay)
            .flatMap { listTitle, listPrimaryColor -> Observable<Void> in
                return .just(())
            })
    }
}
