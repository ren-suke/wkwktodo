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
    var folderId: Int?
    
    @IBOutlet private weak var addTaskButton: UIButton!
    private var viewModel: TaskListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        
    }
    
    static func make() -> UINavigationController {
        return UINavigationController(rootViewController: R.storyboard.materials.materials()!)
    }
    
    private func configure() {
        largeTitle()
        view.makeGradation()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.dataSource = dataSource
        tableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil),
                           forCellReuseIdentifier: R.reuseIdentifier.taskTableViewCell.identifier)
        tableView.rowHeight = 50
        
        viewModel = .init(input: TaskListViewModelInput(
            addTaskButtonTapped: addTaskButton.rx.tap.asObservable(),
            taskCellCheckBoxClicked: dataSource.checkBoxTapped.asObservable(),
            taskRealmQueryType: self.taskRealmQueryType,
            folderId: self.folderId
        ))
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
    }
    
    private var showKeyboard: Binder<Void> {
        return Binder(self) { me, _ in
            Alertift
                .alert(title: "タスクを追加", message: nil)
                .textField(configurationHandler: { textField in
                    textField.placeholder = "YOUR TASK"
                })
                .action(.default("OK")) { _, _, textFields in
                    let title = textFields!.first!.text!
                    self.viewModel?.addTaskSubject.onNext(title)
                }
                .show(on: me, completion: nil)
        }
    }
}
