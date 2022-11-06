//
//  MainScreenRouter.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

import UIKit

class MainScreenRouter {
    
    // MARK: - External vars
    weak var viewController: UIViewController?
}

extension MainScreenRouter: MainScreenRoutingLogic {
    
    func navigateToQuotesOfTheDayScreen() {
        viewController?.navigationController?.pushViewController(QuotesOfTheDayScreenAssembly.build(), animated: true)
    }
}
