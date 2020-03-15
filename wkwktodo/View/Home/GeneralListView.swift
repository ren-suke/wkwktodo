//
//  GeneralListView.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/15.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

class GeneralListView: UIView {
    @IBOutlet private weak var primaryColorView: PrimaryColorView!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(primryColor: UIColor, count: Int, title: String) {
        primaryColorView.backgroundColor = primryColor
        countLabel.text = String(count)
        titleLabel.text = title
    }
}
