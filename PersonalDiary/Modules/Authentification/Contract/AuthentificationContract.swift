//
//  AuthentificationContract.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import ArticleManager

// MARK: View Output (Presenter -> View)
protocol PresenterToViewAuthentificationProtocol: AnyObject {
    func showAlert(message: String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAuthentificationProtocol: AnyObject {
    var dataSource:PresenterToDataSourceAuthentificationProtocol { get }
    func viewDidLoad()
    func didButtonTapped()
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAuthentificationProtocol: AnyObject {
    
}

// MARK: Presenter Output (Presenter -> Router)
protocol PresenterToRouterAuthentificationProtocol: AnyObject {
    func routeToDiary()
}

// MARK: Presenter Output (Presenter -> DataSource)
protocol PresenterToDataSourceAuthentificationProtocol: UITableViewDataSource {
    func updateForSections(_ sections: [SectionModel])
}

// MARK: Cell Input (Cell -> Presenter)
protocol CellToPresenterAuthentificationProtocol: AnyObject {

}
