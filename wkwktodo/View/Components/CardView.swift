//
//  CardView.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/16.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("asoinfao")
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 12
        clipsToBounds = true
    }
}
