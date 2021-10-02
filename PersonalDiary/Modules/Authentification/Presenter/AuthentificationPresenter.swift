//
//  AuthentificationPresenter.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import Foundation

class AuthentificationPresenter: ViewToPresenterAuthentificationProtocol {

    // MARK: Properties
    weak var view: PresenterToViewAuthentificationProtocol!
    let interactor: PresenterToInteractorAuthentificationProtocol
    let router: PresenterToRouterAuthentificationProtocol
    let dataSource:PresenterToDataSourceAuthentificationProtocol

    // MARK: Init
    init(view: PresenterToViewAuthentificationProtocol,
         interactor: PresenterToInteractorAuthentificationProtocol,
         router: PresenterToRouterAuthentificationProtocol,
         dataSource: PresenterToDataSourceAuthentificationProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.dataSource = dataSource
    }

    func viewDidLoad(){
        print("I was presented")
    }
}

extension AuthentificationPresenter: CellToPresenterAuthentificationProtocol {
    
}
