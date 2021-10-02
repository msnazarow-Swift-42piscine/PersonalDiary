//
//  AuthentificationContract.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewAuthentificationProtocol: AnyObject {

}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAuthentificationProtocol: AnyObject {
    var dataSource:PresenterToDataSourceAuthentificationProtocol { get }
    func viewDidLoad()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAuthentificationProtocol: AnyObject {

}

// MARK: Presenter Output (Presenter -> Router)
protocol PresenterToRouterAuthentificationProtocol: AnyObject {
    
}

// MARK: Presenter Output (Presenter -> DataSource)
protocol PresenterToDataSourceAuthentificationProtocol: UITableViewDataSource {
    func updateForSections(_ sections: [SectionModel])
}

// MARK: Cell Input (Cell -> Presenter)
protocol CellToPresenterAuthentificationProtocol: AnyObject {

}
