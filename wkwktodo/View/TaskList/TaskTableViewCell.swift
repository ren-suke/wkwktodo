//
//  TaskTableViewCell.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/20.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkBox: CheckBox!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var disposeBag: DisposeBag = .init()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkBox.borderStyle = .roundedSquare(radius: 3)
        checkBox.style = .tick
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = .init()
    }
    
    func configure(with task: Task) {
        titleLabel.text = task.title
        checkBox.isChecked = task.isCompleted
    }
}
