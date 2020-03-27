//
//  TaskTableViewDataSource.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/26.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class TaskTableViewDataSource: NSObject, UITableViewDataSource, RxTableViewDataSourceType {
    let checkBoxTapped: PublishSubject<IndexPath> = .init()
    
    typealias Element = [Task]
    private var items: Element = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: R.reuseIdentifier.taskTableViewCell.identifier,
            for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        cell.configure(with: item)
        cell.checkBox.rx.controlEvent(.valueChanged)
            .impactOccurred(.light)
            .subscribe({ [weak self] _ in
                self?.checkBoxTapped.onNext(indexPath)
            })
            .disposed(by: cell.disposeBag)
        return cell
    }
    
    func tableView(_ tableView: UITableView, observedEvent: Event<Element>) {
        Binder<Element>(self) { dataSource, items in
            dataSource.items = items
            tableView.reloadData()
        }.on(observedEvent)
    }
}
