//
//  TaskListViewController.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/14.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit
import Alertift
import RxSwift
import RxCocoa

class TaskListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let dataSource: TaskTableViewDataSource = .init()
    var taskRealmQueryType: TaskRealmQueryType?
    var folder: Folder?
    
    @IBOutlet private weak var addTaskButton: UIButton!
    private var viewModel: TaskListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        largeTitle()
        view.makeGradation()
    }
}

extension TaskListViewController {
    private var showResultAlert: Binder<String> {
        return Binder<String>(self) { me, str in
            Alertift
                .alert(title: "結果", message: "このタスクのわくわく度は... \n \(str)でした！！")
                .action(.default("OK"))
                .show(on: me, completion: nil)
        }
    }}
