//
//  ArticleRouter.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import UIKit

class ArticleRouter: PresenterToRouterArticleProtocol {

    // MARK: - Properties
    weak var view: UIViewController!

    // MARK: - Init
    init(view: UIViewController) {
        self.view = view
    }

    func routeToDiary() {
        view.navigationController?.popViewController(animated: true)
    }
}
