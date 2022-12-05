//
//  StartScreenView.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.12.2022.
//

import SwiftUI

typealias Model = QuotesModel

struct StartScreenView: View {
    
    @ObservedObject
    var observedObject = StartScreenObservable()
    
    @State
    private var offset: CGFloat = 600
    
    private let backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    
    var body: some View {
        ZStack {
            
            Color(backgroundColor)
                .edgesIgnoringSafeArea(.all)
            
            RandomQuoteView()
                .environmentObject(observedObject)
                .offset(y: offset)
                .animation(.interpolatingSpring(
                    stiffness: 7,
                    damping: 3)
                    .delay(0.3),
                    value: offset
                )
                .onAppear {
                    offset = 0
                }
        }
    }
    
    func showQuote(quoteViewModel: Model.RandomQuote.ViewModel) {
        self.observedObject.quoteText = quoteViewModel.quote.text
        self.observedObject.quoteAuthor = quoteViewModel.quote.author
        self.observedObject.showQuoteState = true
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView(observedObject: StartScreenObservable())
    }
}
