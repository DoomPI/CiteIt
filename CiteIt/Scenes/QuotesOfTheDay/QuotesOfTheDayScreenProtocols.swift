//
//  QuotesOfTheDayScreenProtocols.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.11.2022.
//

import Foundation

protocol QuotesOfTheDayScreenDisplayLogic: AnyObject {
    typealias Model = QuotesModel
    func display(model: [Model.Quote])
}

protocol QuotesOfTheDayScreenPresentationLogic {
    typealias Model = QuotesModel
    func present(quotesList: [Model.Quote])
}

protocol QuotesOfTheDayScreenBusinessLogic {
    typealias Model = QuotesModel
    func fetchQuotes()
    func showQuotes()
}

protocol QuotesOfTheDayScreenRoutingLogic {
    func navigateBack()
}

protocol QuotesOfTheDayScreenWorkingLogic {
    typealias Model = QuotesModel
    func getQuotes(_ request: Model.GetQuoteOfTheDay.Request, completion: @escaping ([Model.Quote]) -> ())
    func loadQuotes(completion: @escaping ([Model.Quote]) -> ())
}
