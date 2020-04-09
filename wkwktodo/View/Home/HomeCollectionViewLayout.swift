//
//  HomeCollectionViewLayout.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/08.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit
import IBPCollectionViewCompositionalLayout

struct HomeCollectionViewLayout {
    static func create() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {(
            sectionIndex,
            layoutEnvironment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return self.createWPViewLayout()
            case 1:
                return self.createStanadardListLayout()
            case 2:
                return self.createOriginalListLayout()
            default:
                return nil
            }
        }
        return layout
    }
    
    static private func createWPViewLayout() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.25))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    static private func createStanadardListLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.25))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 15, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    static private func createOriginalListLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1 / 7))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = itemSize
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20)
        return section
    }
}
