//
//  DiaryContract.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import ArticleManager

// MARK: View Output (Presenter -> View)
protocol PresenterToViewDiaryProtocol: AnyObject {
    func reloadTableViewData() 
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDiaryProtocol: AnyObject {
    var dataSource:PresenterToDataSourceDiaryProtocol { get }
    
    func viewDidLoad()
    func viewWillAppear()
    func didButtonTapped()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDiaryProtocol: AnyObject {
    func save()
    func newArticle(title: String?, content: String?, image: UIImage?) -> Article
    func getAllArticles() -> [Article]
    func getArticles(withLang lang: String) -> [Article]
    func getArticles(containString str: String) -> [Article]
    func removeArticle(article: Article)
    func removeArticles(articles: [Article])
    func removeAllArticles()
}
extension PresenterToInteractorDiaryProtocol {
    func newArticle(title: String? = nil, content: String? = nil, image: UIImage? = nil) -> Article {
        newArticle(title: title, content: content, image: image)
    }
}

// MARK: Presenter Output (Presenter -> Router)
protocol PresenterToRouterDiaryProtocol: AnyObject {
    func routeToArticle(with article: Article?)
}

extension PresenterToRouterDiaryProtocol {
    func routeToArticle() {
        routeToArticle(with: nil)
    }
}

// MARK: Presenter Output (Presenter -> DataSource)
protocol PresenterToDataSourceDiaryProtocol: UITableViewDataSource, UITableViewDelegate {
    func updateForSections(_ sections: [SectionModel])
}

// MARK: Cell Input (Cell -> Presenter)
protocol CellToPresenterDiaryProtocol: AnyObject {
    func removeArticle(article: Article)
    func didSelect(article: Article)
}
