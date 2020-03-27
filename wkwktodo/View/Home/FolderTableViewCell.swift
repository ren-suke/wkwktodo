//
//  TaskTableViewCell.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/15.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FolderTableViewCell: UITableViewCell {
    @IBOutlet weak var button: UIButton!
    @IBOutlet private weak var paddingView: UIView!
    @IBOutlet private weak var primaryColorView: PrimaryColorView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var progressLabel: UILabel!
    
    var disposeBag: DisposeBag = .init()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        paddingView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = .init()
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
}

enum CellType {
    case first
    case body
    case last
}
