//
//  UIView+Gradient.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/14.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

extension UIView {
    func makeGradation() {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.frame
        let colors: [CGColor] = [R.color.gradationTop()!.cgColor, R.color.gradationBottom()!.cgColor]
        gradientLayer.colors = colors
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
