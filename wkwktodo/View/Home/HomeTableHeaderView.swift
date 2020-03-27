//
//  HomeTableHeaderView.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/16.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift

final class HomeTableHeaderView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet private weak var totalWPLabel: UILabel!
    @IBOutlet fileprivate weak var todaysTaskButton: UIButton!
    @IBOutlet fileprivate weak var completedTaskButton: UIButton!
    @IBOutlet private weak var todaysTasksCountLabel: UILabel!
    @IBOutlet private weak var completedTasksCountLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    func configure(totalWP: Int, todaysTasksCount: Int, completedTasksCount: Int) {
        totalWPLabel.text = String(totalWP)
        todaysTasksCountLabel.text = String(todaysTasksCount)
        completedTasksCountLabel.text = String(completedTasksCount)
    }
}

extension Reactive where Base: HomeTableHeaderView {
    var todayTaskButtonTap: Observable<Void> {
        return base.todaysTaskButton.rx.tap.asObservable()
    }
    
    var completedTaskButtonTap: Observable<Void> {
        return base.completedTaskButton.rx.tap.asObservable()
    }
}
