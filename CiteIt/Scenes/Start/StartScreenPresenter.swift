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
    
    func presentQuotesList(quotesList: Model.GetQuotesList.Response) {
        
        var viewObjects: [Model.GetQuotesList.ViewObject] = []
        
        for index in 0 ..< quotesList.count {
            viewObjects.append(Model.GetQuotesList.ViewObject(
                quote: quotesList[index]
            ))
        }
        
        viewController?.passQuotesList(viewModel: Model.GetQuotesList.ViewModel(
            quotesList: viewObjects
        ))
    }
    
    func present() {
        viewController?.display()
    }
}

