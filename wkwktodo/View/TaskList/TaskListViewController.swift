//
//  TaskListViewController.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/14.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    static func make() -> UINavigationController {
        return UINavigationController(rootViewController: R.storyboard.materials.materials()!)
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = R.nib.taskTableViewCell(owner: tableView)!
        cell.configure(task: Task(id: indexPath.row, title: "AAA\(indexPath.row)", deadline: Date(), isCompleted: false, completedDate: nil, wp: 0))
        return cell
    }
}
