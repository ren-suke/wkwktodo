//
//  HomeCollectionViewDataSource.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/08.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import UIKit

class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 12
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let wpViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WPViewCell", for: indexPath) as? WrapperCell<WPView> else { return UICollectionViewCell() }
            wpViewCell.update { wpView in
                wpView.configure(wp: 10000)
            }
            return wpViewCell
        case 1:
            guard let standardFolderViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StandardFolderViewCell", for: indexPath) as? WrapperCell<StandardFolderView> else { return UICollectionViewCell() }
            standardFolderViewCell.update { standardFolderView in
                standardFolderView.configure(taskCount: Int.random(in: 1...100), title: ["today", "all"][indexPath.row])
                standardFolderViewCell.layoutIfNeeded()
            }
            return standardFolderViewCell
        case 2:
            guard let originalFolderViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OriginalFolderViewCell", for: indexPath) as? WrapperCell<OriginalFolderView> else { return UICollectionViewCell() }
            var cellType: CellType = .body
            if indexPath.row == 0 { cellType = .first }
            if indexPath.row == 11 { cellType = .last}
            originalFolderViewCell.update { originalFolderView in
                originalFolderView.configure(cellType, folderCellType: FolderCellType(id: 1, primaryColor: .blue, title: "AAA \(indexPath.row)", progress: "\(indexPath.row)/100"))
                originalFolderView.layoutIfNeeded()
            }
            return originalFolderViewCell
        default:
            return UICollectionViewCell()
        }
    }
}
