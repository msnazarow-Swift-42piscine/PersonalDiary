//
//  ArticleContract.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import ArticleManager

// MARK: View Output (Presenter -> View)
protocol PresenterToViewArticleProtocol: AnyObject {
    func openCamera()
    func openGalery()
    func setArticleTitle(title: String)
    func setArticleContent(content: String)
    func setArticleImage(data: Data)
    func getArticleTitle() -> String?
    func getArticleContent() -> String?
    func getArticleImage() -> Data?
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterArticleProtocol: AnyObject {
    var dataSource:PresenterToDataSourceArticleProtocol { get }
    func viewDidLoad()
    func buttonDidTapped(title: String)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorArticleProtocol: AnyObject {
    func save()
    func newArticle(title: String?, content: String?, image: UIImage?) -> Article
    func getAllArticles() -> [Article]
    func getArticles(withLang lang: String) -> [Article]
    func getArticles(containString str: String) -> [Article]
    func removeArticle(article: Article)
    func removeArticles(articles: [Article])
    func removeAllArticles()
}

extension PresenterToInteractorArticleProtocol {
    func newArticle() -> Article {
        newArticle(title: nil, content: nil, image: nil)
    }
}

// MARK: Presenter Output (Presenter -> Router)
protocol PresenterToRouterArticleProtocol: AnyObject {
    func routeToDiary()
}

// MARK: Presenter Output (Presenter -> DataSource)
protocol PresenterToDataSourceArticleProtocol: UITableViewDataSource, UITableViewDelegate {
    func updateForSections(_ sections: [SectionModel])
}

// MARK: Cell Input (Cell -> Presenter)
protocol CellToPresenterArticleProtocol: AnyObject {

}
