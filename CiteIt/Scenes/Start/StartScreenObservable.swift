//
//  StartScreenObservable.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.12.2022.
//

import Foundation

class StartScreenObservable: ObservableObject {
    
    @Published
    var quoteViewModel = Model.GetRandomQuote.ViewModel.empty
    
    @Published
    var quotesListViewModel = Model.GetQuotesList.ViewModel.empty
}
