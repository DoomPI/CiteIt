//
//  StartScreenView.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.12.2022.
//

import SwiftUI

struct StartScreenView: View {
    
    @ObservedObject
    var observedObject: StartScreenObservable
    
    private let backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    
    var body: some View {
        ZStack {
            Color(backgroundColor)
                .edgesIgnoringSafeArea(.all)
            Text(observedObject.quoteText)
                .foregroundColor(.white)
        }
    }
    
    func showQuote(quote: String) {
        self.observedObject.quoteText = quote
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView(observedObject: StartScreenObservable())
    }
}
