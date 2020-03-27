//
//  HomeTableViewDataSouce.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/25.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeTableViewDataSource: NSObject, UITableViewDataSource, RxTableViewDataSourceType {
    let buttonTapped: PublishSubject<Int> = .init()
    
    typealias Element = [FolderCellType]
    private var items: Element = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: R.reuseIdentifier.folderTableViewCell.identifier,
            for: indexPath) as? FolderTableViewCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        var cellType: CellType = .body
        switch indexPath.row {
        case 0:
            cellType = .first
        case items.count - 1:
            cellType = .last
        default:
            cellType = .body
        }
        cell.configure(cellType, folderCellType: item)
        cell.button.rx.tap
            .subscribe { [weak self] _ in
                self?.buttonTapped.onNext(item.id)
            }
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
