//
//  StartScreenRouter.swift
//  CiteIt
//
//  Created by Роман Ломтев on 06.11.2022.
//

import SwiftUI

class StartScreenRouter {
    
    // MARK: - External vars
    weak var viewController: UIHostingController<StartScreenView>?
}

extension StartScreenRouter: StartScreenRoutingLogic {
    
    func navigateToMainScreen(quotesListViewModel: Model.GetQuotesList.ViewModel) {
        viewController?.dismiss(animated: false) {
            let mainScreenVC = MainScreenAssembly.build(quotesListViewModel: quotesListViewModel)
            mainScreenVC.modalPresentationStyle = .fullScreen
            self.viewController?.navigationController?.present(mainScreenVC, animated: true)
        }
    }
}
