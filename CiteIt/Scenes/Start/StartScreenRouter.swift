//
//  StartScreenRouter.swift
//  CiteIt
//
//  Created by Роман Ломтев on 06.11.2022.
//

import UIKit

class StartScreenRouter {
    
    // MARK: - External vars
    weak var viewController: UIViewController?
}

extension StartScreenRouter: StartScreenRoutingLogic {
    
    func navigateToMainScreen() {
        viewController?.navigationController?.pushViewController(MainScreenAssembly.build(), animated: true)
    }
}
