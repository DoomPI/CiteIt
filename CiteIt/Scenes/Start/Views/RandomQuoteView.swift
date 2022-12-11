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
    private var quoteText: String = ""
    
    @State
    private var quoteAuthor: String = ""
    
    @State
    private var quoteTextDisplayed = ""
    
    @State
    private var quoteAuthorDisplayed = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 70) {
            Text(quoteTextDisplayed)
                .lineSpacing(10)
                .tracking(5)
                .padding(5)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.custom("Organic Peach DEMO", size: 40))

            HStack {
                Spacer()
                Text(quoteAuthorDisplayed)
                    .tracking(5)
                    .foregroundColor(.white)
                    .font(.custom("Organic Peach DEMO", size: 24))
                    .padding(.trailing, 10)
            }
        }
        .padding(20)
        .padding([.leading, .trailing], 10)
        .cornerRadius(10)
        .onReceive(observedObject.$quoteText) { newQuoteText in
            self.quoteText = newQuoteText
            self.quoteTextDisplayed.reserveCapacity(newQuoteText.count)
            for letter in newQuoteText {
                if letter == " " {
                    quoteTextDisplayed.append(" ")
                } else {
                    quoteTextDisplayed.append("\u{00A0}")
                }
            }
        }
        .onReceive(observedObject.$quoteAuthor) { newQuoteAuthor in
            self.quoteAuthor = newQuoteAuthor
            self.quoteAuthorDisplayed.reserveCapacity(newQuoteAuthor.count)
            self.quoteAuthorDisplayed = quoteAuthorDisplayed.padding(toLength: newQuoteAuthor.count, withPad: "\u{00A0}", startingAt: 0)
        }
        .onReceive(observedObject.$showQuoteState) { newShowQuoteState in
            if (newShowQuoteState) {
                typingAnimation()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                showContinueButtonState = true
            }
        }
    }
    
    private func typingAnimation() {
        DispatchQueue.main.async {
            for index in 0...quoteText.count - 1 {
                let quoteTextIndex = quoteText.index(quoteText.startIndex, offsetBy: index)
                let letter = quoteText[quoteTextIndex]
                quoteTextDisplayed = quoteTextDisplayed.replacingCharacters(in: quoteTextIndex...quoteTextIndex, with: String(letter))
                
                if letter == "." || letter == "," {
                    RunLoop.current.run(until: Date() + 0.5)
                } else {
                    RunLoop.current.run(until: Date() + 0.05)
                }
            }
            
            RunLoop.current.run(until: Date() + 0.5)
            
            for index in 0...quoteAuthor.count - 1 {
                let quoteAuthorIndex = quoteAuthor.index(quoteAuthor.startIndex, offsetBy: index)
    
                quoteAuthorDisplayed = quoteAuthorDisplayed.replacingCharacters(in: quoteAuthorIndex...quoteAuthorIndex, with: String(quoteAuthor[quoteAuthorIndex]))
                RunLoop.current.run(until: Date() + 0.05)
            }
        }
    }
}
