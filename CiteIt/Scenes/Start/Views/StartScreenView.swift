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
    
    @State
    private var offset: CGFloat = 600
    
    private let backgroundColor = #colorLiteral(red: 0.9179173112, green: 0.3792040348, blue: 0.4323710203, alpha: 1)
    
    var body: some View {
        ZStack {
            
            Color(backgroundColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                RandomQuoteView(showContinueButtonState: $showContinueButtonState)
                    .environmentObject(observedObject)
                Spacer()
                Button(action: navigateToMainScreenAction) {
                    Image(systemName: "chevron.right.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60)
                }.foregroundColor(.white)
                    .disabled(!showContinueButtonState)
                    .opacity(showContinueButtonState ? 1 : 0)
                    .padding(10)
                    .offset(y: 0)
                    .rotationEffect(.degrees(showContinueButtonState ? -720: 0))
                    .offset(y: showContinueButtonState ? 0 : 60)
                    .animation(
                        .spring(dampingFraction: 0.7)
                        .delay(0.2)
                        .speed(0.5),
                        value: showContinueButtonState ? -600 : 0
                    )
            }
        }
    }
    
    func showQuote(quoteViewModel: Model.GetRandomQuote.ViewModel) {
        self.observedObject.quoteText = quoteViewModel.quote.text
        self.observedObject.quoteAuthor = quoteViewModel.quote.author
        self.observedObject.showQuoteState = true
    }
}
