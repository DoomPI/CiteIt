//
//  RandomQuoteView.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.12.2022.
//

import SwiftUI

struct RandomQuoteView: View {
    
    @EnvironmentObject
    var observedObject: StartScreenObservable
    
    @Binding
    var showContinueButtonState: Bool
    
    @State
    private var offset: CGFloat = 600
    
    @State
    private var quoteText: String = ""
    
    @State
    private var quoteAuthor: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Image(systemName: "quote.opening")
                    .font(.custom("Little Moment", size: 20))
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 2)
                    .overlay(.white)
            }
            VStack(spacing: 40) {
                Text(observedObject.quoteText)
                    .foregroundColor(.white)
                    .font(.custom("Little Moment", size: 24))
                HStack {
                    Spacer()
                    Text(observedObject.quoteAuthor)
                        .foregroundColor(.white)
                        .font(.custom("Little Moment", size: 14))
                }
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 2)
                    .overlay(.white)
                Image(systemName: "quote.closing")
                    .font(.custom("Little Moment", size: 20))
                    .foregroundColor(.white)
            }
        }
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.white, lineWidth: 7)
        )
        .padding([.leading, .trailing], 10)
        .cornerRadius(10)
        .offset(y: offset)
        .animation(
            .interpolatingSpring(
                stiffness: 7,
                damping: 3
            ).delay(0.3),
            value: offset
        )
        .onReceive(observedObject.$quoteText) { newQuoteText in
            self.quoteText = newQuoteText
        }
        .onReceive(observedObject.$quoteAuthor) { newQuoteAuthor in
            self.quoteAuthor = newQuoteAuthor
        }
        .onReceive(observedObject.$showQuoteState) { _ in
            self.offset = 0
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                showContinueButtonState = true
            }
        }
    }
}
