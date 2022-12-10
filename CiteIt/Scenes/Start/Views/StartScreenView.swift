//
//  StartScreenView.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.12.2022.
//

import SwiftUI

typealias Model = QuotesModel

struct StartScreenView: View {
    
    var navigateToMainScreenAction: () -> Void
    
    @ObservedObject
    var observedObject: StartScreenObservable
    
    @State
    private var showContinueButtonState = false
    
    private let backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    
    var body: some View {
        ZStack {
            
            Color(backgroundColor)
                .edgesIgnoringSafeArea(.all)
            
            RandomQuoteView(showContinueButtonState: $showContinueButtonState)
                .environmentObject(observedObject)
            
            VStack {
                Spacer()
                Button(action: navigateToMainScreenAction) {
                    Image(systemName: "chevron.right.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60)
                }.foregroundColor(.white)
                    .disabled(!showContinueButtonState)
                    .opacity(showContinueButtonState ? 1 : 0)
                    .padding(20)
            }
        }
    }
    
    func showQuote(quoteViewModel: Model.RandomQuote.ViewModel) {
        self.observedObject.quoteText = quoteViewModel.quote.text
        self.observedObject.quoteAuthor = quoteViewModel.quote.author
        self.observedObject.showQuoteState = true
    }
}
