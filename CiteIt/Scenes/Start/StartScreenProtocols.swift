//
//  StartScreenProtocols.swift
//  CiteIt
//
//  Created by Роман Ломтев on 06.11.2022.
//

import Foundation
import SwiftUI

protocol StartScreenDisplayLogic: AnyObject {
    typealias Model = QuotesModel
    func display(viewModel: Model.GetRandomQuote.ViewModel)
    func passQuotesList(viewModel: Model.GetQuotesList.ViewModel)
    func display()
}

protocol StartScreenPresentationLogic {
    typealias Model = QuotesModel
    func presentRandomQuote(quotesList: Model.GetRandomQuote.Response)
    func presentQuotesList(quotesList: Model.GetQuotesList.Response)
    func present()
}

protocol StartScreenBusinessLogic {
    typealias Model = QuotesModel
    func fetchRandomQuote()
    func fetchQuotesList()
}

protocol StartScreenRoutingLogic {
    func navigateToMainScreen(quotesListViewModel: QuotesModel.GetQuotesList.ViewModel)
}

protocol StartScreenWorkingLogic {
    typealias Model = QuotesModel
    func getRandomQuote(_ request: Model.GetRandomQuote.Request,
                        didSucceed: @escaping (Model.GetRandomQuote.Response) -> (),
                        didFail: @escaping () -> ()
    )
    func loadRandomQuote(didSucceed: @escaping (Model.GetRandomQuote.Response) -> (),
                         didFail: @escaping () -> ()
    )
    func getQuotesList(_ request: Model.GetQuotesList.Request,
                       didSucceed: @escaping (Model.GetQuotesList.Response) -> (),
                       didFail: @escaping () -> ()
    )
    func loadQuotesList(didSucceed: @escaping (Model.GetQuotesList.Response) -> (),
                        didFail: @escaping () -> ()
    )
}
