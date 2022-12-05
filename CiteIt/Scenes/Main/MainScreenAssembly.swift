//
//  MainAssembly.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

import SwiftUI

enum MainScreenAssembly {
    
    static func build() -> UIHostingController<MainScreenView> {
        
        let presenter = MainScreenPresenter()
        let worker = MainScreenWorker()
        let interactor = MainScreenInteractor(presenter: presenter, worker: worker)
        let router = MainScreenRouter()
        let viewController = MainScreenViewController(interactor: interactor, router: router)
        
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
