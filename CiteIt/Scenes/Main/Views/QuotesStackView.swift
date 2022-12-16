//
//  QuotesStackView.swift
//  CiteIt
//
//  Created by Роман Ломтев on 11.12.2022.
//

import SwiftUI

struct QuotesStackView: View {
    
    var namespace: Namespace.ID
    
    @Binding
    var quotesViewModel: Model.GetQuotesList.ViewModel
    
    var body: some View {
        
        let size = UIScreen.main.bounds.size
        let count = quotesViewModel.quotesList.count
        let numberOfVisible: CGFloat = 3
        
        if (count == 0) {
            
        } else {
            
            ZStack {
                
                
                ForEach(0 ..< count, id: \.self) { index in
                    
                    let reverseIndex = Double(quotesViewModel.quotesList.endIndex - index - 1)
                    
                    QuoteView(
                        namespace: namespace,
                        id: Int(reverseIndex),
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
        }
    }
}
