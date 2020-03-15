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

class HomeViewController: UIViewController {
    private var collectionBarButtonItem: UIBarButtonItem = UIBarButtonItem(
        barButtonSystemItem: .search,
        target: self,
        action: nil
    )
    private var editBarButtonItem: UIBarButtonItem = UIBarButtonItem(
        barButtonSystemItem: .edit,
        target: self,
        action: nil
    )
    @IBOutlet private weak var tableView: UITableView!
    
    private let disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        navigationItem.title = "Home"
        largeTitle()
        navigationItem.leftBarButtonItem = collectionBarButtonItem
        navigationItem.rightBarButtonItem = editBarButtonItem
        view.makeGradation()
    }
}
