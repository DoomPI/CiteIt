//
//  MainProtocols.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

protocol MainScreenDisplayLogic: AnyObject {
    typealias Model = QuotesModel
    func display(model: [Model.Quote])
}

protocol MainScreenPresentationLogic {
    typealias Model = QuotesModel
    func present(quotesList: [Model.Quote])
}

protocol MainScreenBusinessLogic {
    typealias Model = QuotesModel
    func fetchQuotes()
    func showQuotes()
}

protocol MainScreenRoutingLogic {
    func navigateToQuotesOfTheDayScreen()
}

protocol MainScreenWorkingLogic {
    typealias Model = QuotesModel
    func getQuotes(_ request: Model.GetQuotesList.Request, completion: @escaping ([Model.Quote]) -> ())
    func loadQuotes(completion: @escaping ([Model.Quote]) -> ())
}
