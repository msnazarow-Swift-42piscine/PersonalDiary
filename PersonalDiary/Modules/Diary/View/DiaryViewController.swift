//
//  DiaryViewController.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import UIKit

class DiaryViewController: UITableViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterDiaryProtocol!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppear()
    }

    private func setupUI() {
        addSubviews()
        setupConstraints()
        title = "Diary"
        tableView.dataSource = presenter.dataSource
        tableView.delegate = presenter.dataSource
        tableView.register(ArticleCell.self, forCellReuseIdentifier: String(describing: ArticleCell.self))
    }

    private func addSubviews() {
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(didButtonTapped))
    }

    private func setupConstraints() {

    }

    func reloadTableViewData() {
        tableView.reloadData()
    }

    @objc func didButtonTapped() {
        presenter.didButtonTapped()
    }
}

extension DiaryViewController: PresenterToViewDiaryProtocol{
    
}
