//
//  StartScreenInteractor.swift
//  CiteIt
//
//  Created by Роман Ломтев on 06.11.2022.
//

import Foundation

class StartScreenInteractor {
 
    // MARK: - Internal vars
    private let presenter: StartScreenPresentationLogic
    private let worker: StartScreenWorkingLogic
    
    init(presenter: StartScreenPresentationLogic, worker: StartScreenWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension StartScreenInteractor: StartScreenBusinessLogic {
    
    func fetchRandomQuote() {
        worker.getRandomQuote(
            Model.GetRandomQuote.Request(),
            didSucceed: { [weak self] quotes in
                self?.presenter.presentRandomQuote(quotesList: quotes)
            },
            didFail: { [weak self] in
                self?.presenter.present()
            }
        )
    }
    
    func fetchQuotesList() {
        worker.getQuotesList(
            Model.GetQuotesList.Request(),
            didSucceed: { [weak self] quotes in
                self?.presenter.presentQuotesList(quotesList: quotes)
            },
            didFail: {
                
            }
        )
    }
}
