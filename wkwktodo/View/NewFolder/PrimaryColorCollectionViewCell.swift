//
//  PrimaryColorCollectionViewCell.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/24.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

class PrimaryColorCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var primaryColorView: PrimaryColorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(primaryColor: FolderPrimaryColorType) {
        primaryColorView.backgroundColor = primaryColor.color
    }
}
