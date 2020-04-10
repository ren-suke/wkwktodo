//
//  HomeCollectionViewDataSource.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/08.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, RxCollectionViewDataSourceType {
    typealias Element = [Folder]
    var items: Element = []
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return items.filter {$0.type != .original}.count
        case 2:
            return items.filter {$0.type == .original}.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let wpViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WPViewCell", for: indexPath) as? WrapperCollectionViewCell<WPView> else { return UICollectionViewCell() }
            wpViewCell.update { wpView in
                wpView.configure(wp: 10000)
            }
            return wpViewCell
        case 1:
            guard let standardFolderViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StandardFolderViewCell", for: indexPath) as? WrapperCollectionViewCell<StandardFolderView> else { return UICollectionViewCell() }
            standardFolderViewCell.update { standardFolderView in
                standardFolderView.layoutIfNeeded()
                standardFolderView.configure(taskCount: Int.random(in: 1...100), title: ["today", "all"][indexPath.row])
            }
            return standardFolderViewCell
        case 2:
            guard let originalFolderViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OriginalFolderViewCell", for: indexPath) as? WrapperCollectionViewCell<OriginalFolderView> else { return UICollectionViewCell() }
            var cellType: OriginalFolderCellType = .body
            if indexPath.row == 0 { cellType = .first }
            if indexPath.row == 11 { cellType = .last}
            originalFolderViewCell.update { originalFolderView in
                originalFolderView.layoutIfNeeded()
                originalFolderView.configure(with: FolderCellType(id: 1, primaryColor: .blue, title: "AAA \(indexPath.row)", progress: "\(indexPath.row)/100"), cellType: cellType)
            }
            return originalFolderViewCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, observedEvent: Event<Element>) {
        Binder<Element>(self) { dataSource, element in
            dataSource.items = element
            collectionView.reloadData()
        }.on(observedEvent)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            
        }
    }
}
