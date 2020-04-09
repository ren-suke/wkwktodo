//
//  StandardFolderView.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/08.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

class StandardFolderView: UIView, ReusableViewType, BackingViewMaker {
    typealias View = StandardFolderView
    @IBOutlet private weak var logoView: UIView!
    @IBOutlet private weak var taskCountLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        logoView.clipsToBounds = true
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        print("=-ddd-sfs-")
        logoView.layer.cornerRadius = logoView.bounds.height * 0.5
    }
    
    func configure(taskCount: Int, title: String) {
        taskCountLabel.text = String(taskCount)
        titleLabel.text = title
    }
    
    func prepareForReuse() {
        print("prepareForReuse")
    }
    
    static func makeBackedView() -> StandardFolderView {
        guard let standardFolderView = R.nib.standardFolderView(owner: self) else { return StandardFolderView() }
        return standardFolderView
    }
}
