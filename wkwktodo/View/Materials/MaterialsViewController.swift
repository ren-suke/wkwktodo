//
//  WKWKCollectionViewController.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/14.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

class MaterialsViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        navigationItem.title = "わくわくコレクション"
        largeTitle()
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 32)
        ]
        view.makeGradation()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
//        collectionView.collection.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "MaterialCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: R.reuseIdentifier.materialsCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layout.itemSize = CGSize(width: view.bounds.width * 0.3, height: view.bounds.width * 0.3)
        collectionView.collectionViewLayout = layout
    }
    
    static func make() -> UINavigationController {
        return UINavigationController(rootViewController: R.storyboard.materials.materials()!)
    }
}

extension MaterialsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("----")
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.materialsCollectionViewCell.identifier,
                                 for: indexPath) as? MaterialCollectionViewCell else { return UICollectionViewCell() }
        let materialTypes: [String] = ["wallpaper", "liveWallpaper", "voice", "movie"]
        cell.configure(preview: R.image.wkwk()!, materialType: MaterialType(rawValue: materialTypes[indexPath.item % 4])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("----")
        let horizontalSpace: CGFloat = 20
        let cellSize: CGFloat = self.view.bounds.width / 3 - horizontalSpace
        return CGSize(width: cellSize, height: cellSize)
    }
}
