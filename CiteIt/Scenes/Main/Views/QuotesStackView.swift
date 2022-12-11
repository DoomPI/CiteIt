//
//  QuotesStackView.swift
//  CiteIt
//
//  Created by Роман Ломтев on 11.12.2022.
//

import SwiftUI

struct QuotesStackView: View {
    
    @EnvironmentObject
    var observedObject: MainScreenObservable
    
    @State
    private var quotesViewModel = Model.GetQuotesList.ViewModel.empty
    
    var body: some View {
        VStack {
            ForEach(quotesViewModel.quotesList, id: \.self) { quote in
                QuoteView(quote: quote)
            }
        }
        .frame(height: .infinity)
        .onReceive(observedObject.$quotesViewModel) { newQuoteViewModel in
            self.quotesViewModel = newQuoteViewModel
        }
    }
}

struct QuotesStackView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesStackView()
    }
}
