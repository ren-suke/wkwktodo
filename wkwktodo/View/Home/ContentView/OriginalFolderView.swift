//
//  OriginalFolderView.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/08.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift

class OriginalFolderView: UIView, ReusableViewType, BackingViewMaker {
    typealias View = OriginalFolderView
    @IBOutlet private weak var paddingView: UIView!
    @IBOutlet private weak var primaryColorView: PrimaryColorView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var progressLabel: UILabel!
    
    var disposeBag: DisposeBag = .init()

    override func awakeFromNib() {
        super.awakeFromNib()
        paddingView.clipsToBounds = true
    }
    
    func prepareForReuse() {
        print("prepareForReuse")
    }

    func configure(_ cellType: CellType, folderCellType: FolderCellType) {
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
        
        primaryColorView.backgroundColor = folderCellType.primaryColor.color
        titleLabel.text = folderCellType.title
        progressLabel.text = folderCellType.progress
    }
    
    static func makeBackedView() -> OriginalFolderView {
        guard let originalFolderView = R.nib.originalFolderView(owner: self) as? OriginalFolderView else { return OriginalFolderView() }
        return originalFolderView
    }
}
