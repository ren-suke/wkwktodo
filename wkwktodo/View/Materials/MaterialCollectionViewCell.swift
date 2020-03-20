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
    
    override func select(_ sender: Any?) {
        super.select(sender)
        print("select material collection view cell")
    }
    
    func configure(preview: UIImage, materialType: MaterialType) {
        previewImageView.image = preview
        switch materialType {
        case .wallpaper:
            materialTypeImageView.image = R.image.wallpaper()
        case .liveWallpaper:
            materialTypeImageView.image = R.image.liveWallpaper()
        case .voice:
            materialTypeImageView.image = R.image.voice()
        case .movie:
            materialTypeImageView.image = R.image.movie()
        case .undefined:
            break
        }
    }
}
