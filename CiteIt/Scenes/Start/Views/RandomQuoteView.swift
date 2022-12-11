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
    private var quoteViewModel = Model.GetRandomQuote.ViewModel.empty
    
    @State
    private var quoteTextDisplayed = ""
    
    @State
    private var quoteAuthorDisplayed = ""
    
    private var quoteTextView: some View {
        Text(quoteTextDisplayed)
            .lineSpacing(10)
            .frame(alignment: .top)
            .tracking(5)
            .padding(5)
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
            .font(.custom("Organic Peach DEMO", size: 30))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 60) {

            Text(quoteTextDisplayed)
                .lineSpacing(10)
                .frame(alignment: .top)
                .tracking(5)
                .padding(5)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.custom("Organic Peach DEMO", size: 30))
            
            HStack {
                Spacer()
                Text(quoteAuthorDisplayed)
                    .tracking(5)
                    .foregroundColor(.white)
                    .font(.custom("Organic Peach DEMO", size: 20))
                    .padding(.trailing, 10)
            }
        }
        .padding(20)
        .padding([.leading, .trailing], 10)
        .cornerRadius(10)
        .onReceive(observedObject.$quoteViewModel) { newQuoteViewModel in
            
            if (newQuoteViewModel == Model.GetRandomQuote.ViewModel.empty) {
                return
            }
            
            self.quoteViewModel = newQuoteViewModel
            
            let text = newQuoteViewModel.quote.text
            let author = newQuoteViewModel.quote.author
            
            self.quoteTextDisplayed.reserveCapacity(text.count)
            for letter in text {
                if letter == " " {
                    quoteTextDisplayed.append(" ")
                } else {
                    quoteTextDisplayed.append("\u{00A0}")
                }
            }
            
            self.quoteAuthorDisplayed.reserveCapacity(author.count)
            self.quoteAuthorDisplayed = quoteAuthorDisplayed.padding(toLength: author.count, withPad: "\u{00A0}", startingAt: 0)
            
            typingAnimation {
                self.showContinueButtonState = true
            }
        }
    }
    
    private func typingAnimation(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            
            let quoteText = quoteViewModel.quote.text
            let quoteAuthor = quoteViewModel.quote.author
            
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
            
            completion()
        }
    }
}
