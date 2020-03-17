//
//  TaskTableViewCell.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/15.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet private weak var paddingView: UIView!
    @IBOutlet private weak var primaryColorView: PrimaryColorView!
    @IBOutlet private weak var listTitleLabel: UILabel!
    @IBOutlet private weak var listProgressLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        paddingView.clipsToBounds = true
    }

    func configure(_ cellType: CellType, primaryColor: UIColor, listTitle: String, listProgress: String) {
        switch cellType {
        case .first:
            paddingView.layer.cornerRadius = 12
            paddingView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .body:
            paddingView.layer.cornerRadius = 0
        case .last:
            paddingView.layer.cornerRadius = 12
            paddingView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        
        primaryColorView.backgroundColor = primaryColor
        listTitleLabel.text = listTitle
        listProgressLabel.text = listProgress
    }
}

enum CellType {
    case first
    case body
    case last
}
