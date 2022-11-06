//
//  QuotesOfTheDayScreenInteractor.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.11.2022.
//

import Foundation

class QuotesOfTheDayScreenInteractor {
 
    // MARK: - Internal vars
    private let presenter: QuotesOfTheDayScreenPresentationLogic
    private let worker: QuotesOfTheDayScreenWorkingLogic
    
    init(presenter: QuotesOfTheDayScreenPresentationLogic, worker: QuotesOfTheDayScreenWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension QuotesOfTheDayScreenInteractor: QuotesOfTheDayScreenBusinessLogic {
    
    func fetchQuotes() {
        worker.getQuotes(Model.GetQuoteOfTheDay.Request()) { [weak self] quotes in
            self?.presenter.present(quotesList: quotes)
        }
    }
    
    func showQuotes() {
        worker.loadQuotes { [weak self] quotes in
            self?.presenter.present(quotesList: quotes)
        }
    }
}
