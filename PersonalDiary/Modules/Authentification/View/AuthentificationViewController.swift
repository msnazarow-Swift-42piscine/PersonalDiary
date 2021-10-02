//
//  AuthentificationViewController.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import UIKit

class AuthentificationViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterAuthentificationProtocol!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    private func setupUI() {
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {

    }

    private func setupConstraints() {

    }
}

extension AuthentificationViewController: PresenterToViewAuthentificationProtocol{
    
}
