//
//  MainProtocols.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

protocol MainScreenDisplayLogic: AnyObject {
    typealias Model = QuotesListModel
    func display(model: Model.QuotesList)
}

protocol MainScreenPresentationLogic {
    typealias Model = QuotesListModel
    func present(quotesList: Model.QuotesList)
}

protocol MainScreenBusinessLogic {
    typealias Model = QuotesListModel
    func fetchQuotes()
    func showQuotes()
}

protocol MainScreenRoutingLogic {
    
}

protocol MainScreenWorkingLogic {
    typealias Model = QuotesListModel
    func getQuotesList(_ request: Model.GetQuotesList.Request, completion: @escaping ([Model.Quote]) -> ())
    func loadQuotesList(completion: @escaping ([Model.Quote]) -> ())
}
