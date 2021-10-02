//
//  ArticlePresenter.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import Foundation
import ArticleManager

class ArticlePresenter: ViewToPresenterArticleProtocol {

    // MARK: Properties
    weak var view: PresenterToViewArticleProtocol!
    let interactor: PresenterToInteractorArticleProtocol
    let router: PresenterToRouterArticleProtocol
    let dataSource:PresenterToDataSourceArticleProtocol
    var article: Article?

    // MARK: Init
    init(view: PresenterToViewArticleProtocol,
         interactor: PresenterToInteractorArticleProtocol,
         router: PresenterToRouterArticleProtocol,
         dataSource: PresenterToDataSourceArticleProtocol,
         article: Article? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.dataSource = dataSource
        self.article = article
    }

    func viewDidLoad(){
        if let article = article {
            if let content = article.content {
                view.setArticleContent(content: content)
            }
            if let title = article.title {
                view.setArticleTitle(title: title)
            }
            if let data = article.image {
                view.setArticleImage(data: data)
            }
        }
    }
    
    func buttonDidTapped(title: String) {
        if title == "Take Picture" {
            view.openCamera()
        } else if title == "Choose Picture" {
            view.openGalery()
        } else if title == "Save" {
            if article == nil {
                article = interactor.newArticle()
            } else {
                article?.modificationDate = Date()
            }
            article?.content = view.getArticleContent()
            article?.image = view.getArticleImage()
            article?.title = view.getArticleTitle()
            interactor.save()
            router.routeToDiary()
        } else if title == "Cancel" {
            router.routeToDiary()
        }
    }
}

extension ArticlePresenter: CellToPresenterArticleProtocol {
    
}
