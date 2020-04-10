//
//  ViewController.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/12.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import PKHUD
import Alertift

class HomeViewController: UIViewController {
    private var collectionBarButtonItem: UIBarButtonItem = UIBarButtonItem(
        image: R.image.menu(),
        style: .plain,
        target: self,
        action: nil
    )
    private var editBarButtonItem: UIBarButtonItem = UIBarButtonItem(
        barButtonSystemItem: .edit,
        target: self,
        action: nil
    )
    
    @IBOutlet private weak var collectionView: UICollectionView!
    private let dataSource: HomeCollectionViewDataSource = .init()
    @IBOutlet private weak var addFolderButton: UIBarButtonItem!
    
    let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureCollectionView()
    }
    
    private func configure() {
        navigationItem.title = "Home"
        largeTitle()
        collectionBarButtonItem.tintColor = R.color.dark()
        collectionBarButtonItem.rx.tap
            .subscribe { _ in
                self.present(R.storyboard.materials.materials()!.make(), animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        navigationItem.leftBarButtonItem = collectionBarButtonItem
        editBarButtonItem.tintColor = R.color.dark()
        navigationItem.rightBarButtonItem = editBarButtonItem
        view.makeGradation()
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = dataSource
        collectionView.collectionViewLayout = HomeCollectionViewLayout.create()
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        collectionView.register(WrapperCollectionViewCell<WPView>.self, forCellWithReuseIdentifier: "WPViewCell")
        collectionView.register(WrapperCollectionViewCell<StandardFolderView>.self, forCellWithReuseIdentifier: "StandardFolderViewCell")
        collectionView.register(WrapperCollectionViewCell<OriginalFolderView>.self, forCellWithReuseIdentifier: "OriginalFolderViewCell")
    }
}
