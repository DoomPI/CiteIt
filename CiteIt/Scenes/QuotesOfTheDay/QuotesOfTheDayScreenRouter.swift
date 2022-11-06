//
//  QuotesOfTheDayScreenRouter.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.11.2022.
//

import UIKit

class QuotesOfTheDayScreenRouter {
    
    // MARK: - External vars
    weak var viewController: UIViewController?
}

extension QuotesOfTheDayScreenRouter: QuotesOfTheDayScreenRoutingLogic {
    
    func navigateBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
