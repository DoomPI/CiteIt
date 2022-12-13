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
        
        ZStack {
            
            let size = UIScreen.main.bounds.size
            let count = quotesViewModel.quotesList.count
            let numberOfVisible: CGFloat = 3
            
            ForEach(0 ..< count, id: \.self) { index in
                
                let reverseIndex: CGFloat = CGFloat(count) - CGFloat(index) - 1
                
                QuoteView(
                    quoteVo: quotesViewModel.quotesList[index],
                    quotesViewModel: $quotesViewModel,
                    textPadding: (1 - reverseIndex) * 20,
                    isTextShown: reverseIndex < 2
                )
                .hidden(reverseIndex >= numberOfVisible)
                .offset(x: reverseIndex * 35)
                .padding(reverseIndex * 20)
                .rotationEffect(
                    .degrees(reverseIndex * 8),
                    anchor: .bottomTrailing
                )
                .frame(width: size.width * 0.75, height: size.height * 0.5)
                .zIndex(Double(index))
                .disabled(index != count - 1)
            }
            .transition(.push(from: Edge.trailing))
        }
        .onReceive(observedObject.$quotesViewModel) { newQuoteViewModel in
            self.quotesViewModel = newQuoteViewModel
        }
    }
}
