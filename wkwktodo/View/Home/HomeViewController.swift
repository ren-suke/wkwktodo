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
        collectionView.collectionViewLayout = HomeCollectionViewLayout.create()
    }
}

