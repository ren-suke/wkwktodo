//
//  MaterialCollectionViewCell.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/17.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

class MaterialCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var materialTypeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clipsToBounds = true
        layer.cornerRadius = 12
    }
    
    func configure(preview: UIImage, materialType: MaterialType) {
        previewImageView.image = preview
    
    }
}
