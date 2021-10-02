//
//  ArticleInteractor.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import ArticleManager

class ArticleInteractor: PresenterToInteractorArticleProtocol {
    let manager = ArticleManager.shared

    public func save () {
        manager.save()
    }

    public func newArticle(title: String? = nil, content: String? = nil, image: UIImage? = nil) -> Article {
        manager.newArticle(title: title, content: content, image: image)
    }

    public func getAllArticles() -> [Article] {
        manager.getAllArticles()
    }

    public func getArticles(withLang lang: String) -> [Article] {
        manager.getArticles(withLang: lang)
    }

    public func getArticles(containString str: String) -> [Article] {
        manager.getArticles(containString: str)
    }

    public func removeArticle(article: Article){
        manager.removeArticle(article: article)
    }

    public func removeArticles(articles: [Article]){
        manager.removeArticles(articles: articles)
    }

    public func removeAllArticles(){
        manager.removeAllArticles()
    }
}
