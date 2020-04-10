//
//  AllTaskListViewController.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/10.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

class AllTaskListViewController: UIViewController {
    
    private let tableView: UITableView = .init(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configure() {
        largeTitle()
        view.makeGradation()
        view.addSubview(tableView)
    }
}
