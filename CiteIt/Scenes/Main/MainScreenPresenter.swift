//
//  MainScreenPresenter.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

import Foundation

class MainScreenPresenter {
    
    // MARK: - External vars
    weak var viewController: MainScreenDisplayLogic?
}

extension MainScreenPresenter: MainScreenPresentationLogic {
    
    func present(quotesList: Model.GetQuotesList.Response) {
        
        var viewObjects: [Model.GetQuotesList.ViewObject] = []
        
        for index in 0 ..< quotesList.count {
            viewObjects.append(Model.GetQuotesList.ViewObject(
                quote: quotesList[index]
            ))
        }
        
        viewController?.display(model: Model.GetQuotesList.ViewModel(
            quotesList: viewObjects
        ))
    }
}
