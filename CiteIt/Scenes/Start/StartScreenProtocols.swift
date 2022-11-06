//
//  StartScreenProtocols.swift
//  CiteIt
//
//  Created by Роман Ломтев on 06.11.2022.
//

import Foundation

protocol StartScreenDisplayLogic: AnyObject {
    typealias Model = QuotesModel
    func display(viewModel: Model.RandomQuote.ViewModel)
    func display()
}

protocol StartScreenPresentationLogic {
    typealias Model = QuotesModel
    func presentRandomQuote(quotesList: Model.RandomQuote.Response)
    func present()
}

protocol StartScreenBusinessLogic {
    typealias Model = QuotesModel
    func fetchRandomQuote()
    func loadRandomQuote()
}

protocol StartScreenRoutingLogic {
    func navigateToMainScreen()
}

protocol StartScreenWorkingLogic {
    typealias Model = QuotesModel
    func getRandomQuote(_ request: Model.RandomQuote.Request,
                        didSucceed: @escaping (Model.RandomQuote.Response) -> (),
                        didFail: @escaping () -> ()
    )
    func loadRandomQuote(didSucceed: @escaping (Model.RandomQuote.Response) -> (),
                         didFail: @escaping () -> ()
    )
}
