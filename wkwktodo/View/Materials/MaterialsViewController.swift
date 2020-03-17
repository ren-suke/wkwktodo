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
        view.makeGradation()
    }
    
    static func make() -> UINavigationController {
        return UINavigationController(rootViewController: R.storyboard.materials.materials()!)
    }
}
