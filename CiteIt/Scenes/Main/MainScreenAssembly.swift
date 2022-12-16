//
//  MainAssembly.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

import SwiftUI

enum MainScreenAssembly {
    
    static func build(quotesListViewModel: Model.GetQuotesList.ViewModel) -> UIHostingController<MainScreenView> {
        let observable = MainScreenObservable()
        observable.quotesViewModel = quotesListViewModel
        let view = MainScreenView(observedObject: observable)
        let viewController = MainScreenViewController(view: view)
        
        return viewController
    }
}
