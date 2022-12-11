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
    func display()
}

protocol StartScreenPresentationLogic {
    typealias Model = QuotesModel
    func presentRandomQuote(quotesList: Model.GetRandomQuote.Response)
    func present()
}

protocol StartScreenBusinessLogic {
    typealias Model = QuotesModel
    func fetchRandomQuote()
}

protocol StartScreenRoutingLogic {
    func navigateToMainScreen()
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
}
