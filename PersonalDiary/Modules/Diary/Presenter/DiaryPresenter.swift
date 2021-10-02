//
//  DiaryPresenter.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import ArticleManager

class DiaryPresenter: ViewToPresenterDiaryProtocol {

    // MARK: Properties
    weak var view: PresenterToViewDiaryProtocol!
    let interactor: PresenterToInteractorDiaryProtocol
    let router: PresenterToRouterDiaryProtocol
    let dataSource:PresenterToDataSourceDiaryProtocol

    // MARK: Init
    init(view: PresenterToViewDiaryProtocol,
         interactor: PresenterToInteractorDiaryProtocol,
         router: PresenterToRouterDiaryProtocol,
         dataSource: PresenterToDataSourceDiaryProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.dataSource = dataSource
    }

    func viewDidLoad(){
//        interactor.removeAllArticles()
//        interactor.newArticle(title: "Test Title", content: "Test Content")
//        interactor.newArticle(title: "Test Title", content: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur")
    }

    func viewWillAppear() {
        guard let lang = Locale.current.languageCode else { return }
        dataSource.updateForSections([SectionModel(interactor.getArticles(withLang: lang))])
        view.reloadTableViewData()
    }

    func didButtonTapped() {
        router.routeToArticle()
    }
}

extension DiaryPresenter: CellToPresenterDiaryProtocol {
    func removeArticle(article: Article) {
        interactor.removeArticle(article: article)
        interactor.save()
    }

    func didSelect(article: Article) {
        router.routeToArticle(with: article)
    }
}
