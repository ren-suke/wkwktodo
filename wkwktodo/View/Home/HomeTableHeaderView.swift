//
//  HomeTableHeaderView.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/16.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

@IBDesignable
class HomeTableHeaderView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet private weak var totalWPLabel: UILabel!
    @IBOutlet private weak var todaysTaskButton: UIButton!
    @IBOutlet private weak var completedTaskButton: UIButton!
    @IBOutlet private weak var todaysTasksCountLabel: UILabel!
    @IBOutlet private weak var completedTasksCountLabel: UILabel!
    
    func configure(totalWP: Int, todaysTasksCount: Int, completedTasksCount: Int) {
        totalWPLabel.text = String(totalWP)
        todaysTasksCountLabel.text = String(todaysTasksCount)
        completedTasksCountLabel.text = String(completedTasksCount)
    }
}
