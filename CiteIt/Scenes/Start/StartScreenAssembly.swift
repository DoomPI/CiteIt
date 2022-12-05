//
//  StartScreenAssembly.swift
//  CiteIt
//
//  Created by Роман Ломтев on 06.11.2022.
//

import SwiftUI

enum StartScreenAssembly {
    
    static func build() -> UIHostingController<StartScreenView> {
        let presenter = StartScreenPresenter()
        let worker = StartScreenWorker()
        let interactor = StartScreenInteractor(presenter: presenter, worker: worker)
        let router = StartScreenRouter()
        let view = StartScreenView(navigateToMainScreenAction: router.navigateToMainScreen)
        let viewController = StartScreenViewController(view: view, interactor: interactor, router: router)
        
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
