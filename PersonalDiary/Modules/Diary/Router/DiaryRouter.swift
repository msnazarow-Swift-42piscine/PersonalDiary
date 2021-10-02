//
//  DiaryRouter.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import ArticleManager

class DiaryRouter: PresenterToRouterDiaryProtocol {

    // MARK: - Properties
    weak var view: UIViewController!

    // MARK: - Init
    init(view: UIViewController) {
        self.view = view
    }

    func routeToArticle(with article: Article? = nil) {
        view.navigationController?.pushViewController(ArticleAssembly.createModule(for: article), animated: true)
    }
}
