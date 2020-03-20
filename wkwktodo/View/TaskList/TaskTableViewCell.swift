//
//  TaskTableViewCell.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/20.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var checkBox: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var deadlineLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(task: Task) {
        
    }
}
