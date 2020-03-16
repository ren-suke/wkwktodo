//
//  UIViewController+LargeTitle.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/15.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

extension UIViewController {
    func largeTitle() {
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 40)
        ]
    }
}
