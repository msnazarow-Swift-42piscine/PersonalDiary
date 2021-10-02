//
//  AuthentificationAssembly.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import UIKit

enum AuthentificationAssembly{
    
    // MARK: Static methods
    static func createModule() -> UIViewController {

        let viewController = AuthentificationViewController()
        let router = AuthentificationRouter(view: viewController)
        let interactor = AuthentificationInteractor()
        let dataSource = AuthentificationPresenterDataSource()
        let presenter = AuthentificationPresenter(view: viewController, interactor: interactor, router: router, dataSource: dataSource)

        viewController.presenter = presenter
        dataSource.presenter = presenter

        return viewController
    }
}
