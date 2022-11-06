//
//  MainScreenInteractor.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

class MainScreenInteractor {
 
    // MARK: - Internal vars
    private let presenter: MainScreenPresentationLogic
    private let worker: MainScreenWorkingLogic
    
    init(presenter: MainScreenPresentationLogic, worker: MainScreenWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension MainScreenInteractor: MainScreenBusinessLogic {
    
    func fetchQuotes() {
        worker.getQuotes(Model.GetQuotesList.Request()) { [weak self] quotes in
            self?.presenter.present(quotesList: quotes)
        }
    }
    
    func showQuotes() {
        worker.loadQuotes { [weak self] quotes in
            self?.presenter.present(quotesList: quotes)
        }
    }
}
