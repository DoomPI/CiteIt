//
//  MainScreenObservable.swift
//  CiteIt
//
//  Created by Роман Ломтев on 11.12.2022.
//

import Foundation

class MainScreenObservable: ObservableObject {
    
    @Published
    var quotesViewModel = Model.GetQuotesList.ViewModel.empty
}
