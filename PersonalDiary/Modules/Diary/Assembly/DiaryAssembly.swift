//
//  DiaryAssembly.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import UIKit

enum DiaryAssembly{
    
    // MARK: Static methods
    static func createModule() -> UIViewController {

        let viewController = DiaryViewController()
        let router = DiaryRouter(view: viewController)
        let interactor = DiaryInteractor()
        let dataSource = DiaryPresenterDataSource()
        let presenter = DiaryPresenter(view: viewController, interactor: interactor, router: router, dataSource: dataSource)

        viewController.presenter = presenter
        dataSource.presenter = presenter

        return viewController
    }
}
