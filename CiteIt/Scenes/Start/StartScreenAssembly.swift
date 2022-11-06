//
//  StartScreenAssembly.swift
//  CiteIt
//
//  Created by Роман Ломтев on 06.11.2022.
//

import UIKit

enum StartScreenAssembly {
    
    static func build() -> UIViewController {
        let presenter = StartScreenPresenter()
        let worker = StartScreenWorker()
        let interactor = StartScreenInteractor(presenter: presenter, worker: worker)
        let router = StartScreenRouter()
        let viewController = StartScreenViewController(interactor: interactor, router: router)
        
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
