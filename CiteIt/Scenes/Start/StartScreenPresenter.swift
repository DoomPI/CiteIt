//
//  StartScreenPresenter.swift
//  CiteIt
//
//  Created by Роман Ломтев on 06.11.2022.
//

class StartScreenPresenter {
    
    // MARK: - External vars
    weak var viewController: StartScreenDisplayLogic?
}

extension StartScreenPresenter: StartScreenPresentationLogic {
    
    func presentRandomQuote(quotesList: Model.RandomQuote.Response) {
        let data = quotesList[0]
        viewController?.display(viewModel: Model.RandomQuote.ViewModel(quote: data))
    }
    
    func present() {
        viewController?.display()
    }
}

