//
//  NewListViewController.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/21.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

class NewFolderViewController: UIViewController {
    
    @IBOutlet private weak var doneButton: UIButton!
    
    @IBOutlet private weak var primaryColorView: PrimaryColorView!
    @IBOutlet private weak var listTitleTextField: UITextField!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private lazy var viewModel: NewFolderViewModel = NewFolderViewModel(
        listTitle: self.listTitleTextField.rx.text.asObservable(),
        doneButtonTapped: self.doneButton.rx.tap.asObservable()
    )

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
