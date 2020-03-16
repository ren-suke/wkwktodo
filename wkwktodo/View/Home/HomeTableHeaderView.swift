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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
//        let thisView = R.nib.tableHeaderView(owner: self)
//        thisView!.frame = bounds
//        addSubview(thisView!)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        let thisView = R.nib.tableHeaderView(owner: self)
        thisView!.frame = bounds
        addSubview(thisView!)
    }
}
