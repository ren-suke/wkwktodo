//
//  TaskTableViewCell.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/15.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet private weak var primaryColorView: PrimaryColorView!
    @IBOutlet private weak var listTitleLabel: UILabel!
    @IBOutlet private weak var listProgressLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(primaryColor: UIColor, listTitle: String, listProgress: String) {
        primaryColorView.backgroundColor = primaryColor
        listTitleLabel.text = listTitle
        listProgressLabel.text = listProgress
    }
}
