//
//  MainProtocols.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

protocol MainScreenDisplayLogic: AnyObject {
    typealias Model = QuotesModel
    func display(model: Model.GetQuotesList.ViewModel)
}

protocol MainScreenPresentationLogic {
    typealias Model = QuotesModel
    func present(quotesList: Model.GetQuotesList.Response)
}

protocol MainScreenBusinessLogic {
    typealias Model = QuotesModel
    func fetchQuotes()
}

protocol MainScreenRoutingLogic {
    func navigateToQuotesOfTheDayScreen()
}

protocol MainScreenWorkingLogic {
    typealias Model = QuotesModel
    func getQuotesList(_ request: Model.GetQuotesList.Request,
                       didSucceed: @escaping (Model.GetQuotesList.Response) -> (),
                       didFail: @escaping () -> ()
    )
    func loadQuotesList(didSucceed: @escaping (Model.GetQuotesList.Response) -> (),
                        didFail: @escaping () -> ()
    )
}
