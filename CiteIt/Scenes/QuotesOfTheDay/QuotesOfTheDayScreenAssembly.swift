//
//  QuotesOfTheDayScreenAssembly.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.11.2022.
//

import UIKit

enum QuotesOfTheDayScreenAssembly {
    
    static func build() -> UIViewController {
        
        let presenter = QuotesOfTheDayScreenPresenter()
        let worker = QuotesOfTheDayScreenWorker()
        let interactor = QuotesOfTheDayScreenInteractor(presenter: presenter, worker: worker)
        let router = QuotesOfTheDayScreenRouter()
        let viewController = QuotesOfTheDayScreenViewController(interactor: interactor, router: router)
        
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
