//
//  QuotesOfTheDayScreenPresenter.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.11.2022.
//

import Foundation

class QuotesOfTheDayScreenPresenter {
    
    // MARK: - External vars
    weak var viewController: QuotesOfTheDayScreenDisplayLogic?
}

extension QuotesOfTheDayScreenPresenter: QuotesOfTheDayScreenPresentationLogic {
    
    func present(quotesList: [Model.Quote]) {
        viewController?.display(model: quotesList)
    }
}
