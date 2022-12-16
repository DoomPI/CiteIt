//
//  StartScreenAssembly.swift
//  CiteIt
//
//  Created by Роман Ломтев on 06.11.2022.
//

import SwiftUI

enum StartScreenAssembly {
    
    static func build() -> UIHostingController<StartScreenView> {
        let observable = StartScreenObservable()
        let presenter = StartScreenPresenter()
        let worker = StartScreenWorker()
        let interactor = StartScreenInteractor(presenter: presenter, worker: worker)
        let router = StartScreenRouter()
        let viewController = StartScreenViewController(
            observable: observable,
            interactor: interactor,
            router: router
        )
        
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
