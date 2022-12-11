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
        worker.getQuotesList(
            Model.GetQuotesList.Request(),
            didSucceed: { [weak self] quotes in
                self?.presenter.present(quotesList: quotes)
            },
            didFail: {
                
            }
        )
    }
}
