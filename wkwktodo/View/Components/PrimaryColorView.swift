//
//  PrimaryColorView.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/15.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

@IBDesignable
class PrimaryColorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}
