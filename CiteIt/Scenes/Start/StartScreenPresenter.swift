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
    
    func presentRandomQuote(quotesList: Model.GetRandomQuote.Response) {
        let data = quotesList[0]
        
        viewController?.display(viewModel: Model.GetRandomQuote.ViewModel(
            quote: Model.Quote(
                text: data.text.divideIntoLines(charsPerLine: 15),
                author: data.author
            )
        ))
    }
    
    func present() {
        viewController?.display()
    }
}

