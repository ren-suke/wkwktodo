//
//  OriginalFolderView.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/08.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

class OriginalFolderView: UIView, ReusableViewType, BackingViewMaker {
    typealias View = OriginalFolderView
    @IBOutlet private weak var logoView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var progressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
        logoView.clipsToBounds = true
        logoView.layer.cornerRadius = 15
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        print("=---")
        logoView.layer.cornerRadius = logoView.bounds.height * 0.5
    }
    
    func prepareForReuse() {
        print("prepareForReuse")
    }

    func configure(with folderCellType: FolderCellType, cellType: OriginalFolderCellType) {
        switch cellType {
        case .first:
            layer.cornerRadius = 12
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .body:
            layer.cornerRadius = 0
        case .last:
            layer.cornerRadius = 12
            layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        
        logoView.backgroundColor = folderCellType.primaryColor.color
        titleLabel.text = folderCellType.title
        progressLabel.text = folderCellType.progress
    }
    
    static func makeBackedView() -> OriginalFolderView {
        guard let originalFolderView = R.nib.originalFolderView(owner: self) else { return OriginalFolderView() }
        return originalFolderView
    }
}

enum OriginalFolderCellType {
    case first, body, last
}
