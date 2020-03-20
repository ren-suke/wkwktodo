//
//  ViewController.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/12.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import PKHUD

class HomeViewController: UIViewController {
    private var collectionBarButtonItem: UIBarButtonItem = UIBarButtonItem(
        image: R.image.menu(),
        style: .plain,
        target: self,
        action: nil
    )
    private var editBarButtonItem: UIBarButtonItem = UIBarButtonItem(
        barButtonSystemItem: .edit,
        target: self,
        action: nil
    )
    @IBOutlet private weak var tableView: UITableView!
    
    private let disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureTableView()
    }
    
    private func configure() {
        navigationItem.title = "Home"
        largeTitle()
        collectionBarButtonItem.tintColor = R.color.dark()
        collectionBarButtonItem.imageInsets = UIEdgeInsets(top: 15, left: 5, bottom: 0, right: 0)
        collectionBarButtonItem.rx.tap
            .subscribe { _ in
                self.present(R.storyboard.materials.materials()!.make(), animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        navigationItem.leftBarButtonItem = collectionBarButtonItem
        editBarButtonItem.tintColor = R.color.dark()
        navigationItem.rightBarButtonItem = editBarButtonItem
        view.makeGradation()
    }
    
    private func configureTableView() {
        let tableHeaderView = R.nib.tableHeaderView(owner: tableView)!
        var frame = tableHeaderView.frame
        frame.size.height = frame.height
        tableHeaderView.frame = frame
        tableView.tableHeaderView = tableHeaderView
        tableView.tableHeaderView = tableHeaderView
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.dataSource = self
        tableView.rowHeight = 60
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = R.nib.listTableViewCell(owner: tableView)!
        var cellType: CellType = .body
        switch indexPath.row {
        case 0:
            cellType = .first
        case 9:
            cellType = .last
        default:
            cellType = .body
        }
        
        cell.configure(cellType, primaryColor: .red, listTitle: "AAA \(indexPath.row)", listProgress: "111/222")
        return cell
    }
}
