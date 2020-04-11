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
    typealias Element = HomeCollectionViewType
    var items: Element = .init(wp: 0, standardFolders: [], folders: [])
    private var wp: Int {
        return items.wp
    }
    private var standardFolders: [StandardFolder] {
        return items.standardFolders
    }
    private var folders: [Folder] {
        return items.folders
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return standardFolders.count
        case 2:
            return folders.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let wpViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WPViewCell", for: indexPath) as? WrapperCollectionViewCell<WPView> else { return UICollectionViewCell() }
            wpViewCell.update { wpView in
                wpView.configure(wp: self.wp)
            }
            return wpViewCell
        case 1:
            guard let standardFolderViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StandardFolderViewCell", for: indexPath) as? WrapperCollectionViewCell<StandardFolderView> else { return UICollectionViewCell() }
            standardFolderViewCell.update { standardFolderView in
                standardFolderView.layoutIfNeeded()
                standardFolderView.configure(with: standardFolders[indexPath.row])
            }
            return standardFolderViewCell
        case 2:
            guard let originalFolderViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OriginalFolderViewCell", for: indexPath) as? WrapperCollectionViewCell<FolderView> else { return UICollectionViewCell() }
            var cellType: OriginalFolderCellType = .body
            if indexPath.row == 0 { cellType = .first }
            if indexPath.row == 11 { cellType = .last}
            originalFolderViewCell.update { originalFolderView in
                originalFolderView.layoutIfNeeded()
                originalFolderView.configure(with: folders[indexPath.row], cellType: cellType)
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
