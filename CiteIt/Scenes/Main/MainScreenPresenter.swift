//
//  MainScreenPresenter.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

class MainScreenPresenter {
    
    // MARK: - External vars
    weak var viewController: MainScreenDisplayLogic?
}

extension MainScreenPresenter: MainScreenPresentationLogic {
    
    func present(quotesList: Model.GetQuotesList.Response) {
        viewController?.display(model: Model.GetQuotesList.ViewModel(quotesList: quotesList))
    }
}
