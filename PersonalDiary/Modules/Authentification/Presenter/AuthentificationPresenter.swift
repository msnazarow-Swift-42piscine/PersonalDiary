//
//  AuthentificationPresenter.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import LocalAuthentication

class AuthentificationPresenter: ViewToPresenterAuthentificationProtocol {

    // MARK: Properties
    weak var view: PresenterToViewAuthentificationProtocol!
    let interactor: PresenterToInteractorAuthentificationProtocol
    let router: PresenterToRouterAuthentificationProtocol
    let dataSource:PresenterToDataSourceAuthentificationProtocol

    let context = LAContext()
    var compliton: (() -> Void)! {
        didSet{
            compliton()
        }
    }
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

    }

    func didButtonTapped() {
        auth()
    }
    private func auth() {
        let reason = NSLocalizedString("You should be authorized", comment: "reason for auth")
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
                if !success || error != nil {
                    print(error?.localizedDescription)
                } else {
                    self.router.routeToDiary()
                }
            }
        }
    }
}

extension AuthentificationPresenter: CellToPresenterAuthentificationProtocol {
    
}
