//
//  ArticleAssembly.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import UIKit
import ArticleManager

enum ArticleAssembly{
    
    // MARK: Static methods
    static func createModule(for article: Article? = nil) -> UIViewController {

        let viewController = ArticleViewController()
        let router = ArticleRouter(view: viewController)
        let interactor = ArticleInteractor()
        let dataSource = ArticlePresenterDataSource()
        let presenter = ArticlePresenter(view: viewController,
                                         interactor: interactor,
                                         router: router,
                                         dataSource: dataSource,
                                         article: article)

        viewController.presenter = presenter
        dataSource.presenter = presenter

        return viewController
    }
}
