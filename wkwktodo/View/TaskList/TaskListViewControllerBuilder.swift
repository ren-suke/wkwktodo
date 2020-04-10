//
//  TaskListViewControllerBuilder.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/10.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation

struct TaskListViewControllerBuilder {
    static func build(with folder: Folder) -> TaskListViewController {
        let taskListViewController = R.storyboard.taskList.taskList()!
        taskListViewController.folder = folder
        return taskListViewController
    }
}
