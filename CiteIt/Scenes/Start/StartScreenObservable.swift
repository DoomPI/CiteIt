//
//  StartScreenObservable.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.12.2022.
//

import Foundation

@MainActor
class StartScreenObservable: ObservableObject {
    
    @Published
    var showQuoteState = false
    
    @Published
    var quoteText: String = ""
    
    @Published
    var quoteAuthor: String = ""
}
