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
import Alertift

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
    private var tableHeaderView: HomeTableHeaderView?
    @IBOutlet private weak var tableView: UITableView!
    private let dataSource: HomeTableViewDataSource = .init()
    
    @IBOutlet private weak collectionView: UICollectionView!
    
    @IBOutlet private weak var addFolderButton: UIBarButtonItem!
    
    private lazy var viewModel: HomeViewModel = .init(
        input: HomeViewModelInput(
            collectionButtonTapped: self.collectionBarButtonItem.rx.tap.asObservable(),
            editButtonTapped: self.editBarButtonItem.rx.tap.asObservable(),
            todaysTaskButtonTapped: self.tableHeaderView!.rx.todayTaskButtonTap,
            completedTaskButtonTapped: self.tableHeaderView!.rx.completedTaskButtonTap,
            listTableViewCellTapped: self.dataSource.buttonTapped.asObservable(),
            addFolderButtonTapped: self.addFolderButton.rx.tap.impactOccurred(.light).asObservable(),
            tableHeaderViewDisposeBag: self.tableHeaderView!.disposeBag
        )
    )
    private let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureTableView()
        print("space")
        print(tableHeaderView!.rx.todayTaskButtonTap)
        viewModel.folders
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        viewModel.showTaskList
            .debug()
            .bind(to: showTaskList)
            .disposed(by: disposeBag)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("view did disappear")
    }
    
    private func configure() {
        navigationItem.title = "Home"
        largeTitle()
        collectionBarButtonItem.tintColor = R.color.dark()
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
    
    private func configureCollectionView() {
        
    }
    
    private func configureTableView() {
        if let _tableHeaderView = R.nib.tableHeaderView(owner: tableView) {
            tableHeaderView = _tableHeaderView
            var frame = tableHeaderView!.frame
            frame.size.height = frame.height
            tableHeaderView!.frame = frame
            tableView.tableHeaderView = tableHeaderView
            print("if let _tableHeaderView")
        }
        
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "FolderTableViewCell", bundle: nil),
                           forCellReuseIdentifier: R.reuseIdentifier.folderTableViewCell.identifier)
        tableView.dataSource = dataSource as UITableViewDataSource
        tableView.rowHeight = 60
        print("configureTableView")
    }
}

extension HomeViewController {
    private var showTaskList: Binder<(TaskRealmQueryType?, Int?)> {
        return Binder<(TaskRealmQueryType?, Int?)>(self) { (me, value) in
            print("-------------- show task list")
            let taskListViewController = R.storyboard.taskList.taskList()!
            taskListViewController.taskRealmQueryType = value.0
            taskListViewController.folderId = value.1
            me.navigationController?.pushViewController(taskListViewController, animated: true)
        }
    }
}

