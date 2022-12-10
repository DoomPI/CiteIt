//
//  QuoteView.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.12.2022.
//

import SwiftUI

struct QuoteView: View {
    
    let quoteOpeningImage = Image(
        systemName: "quote.opening"
    )
    let quoteClosingImage = Image(
        systemName: "quote.closing"
    )
    
    var text: String = "Cite it"
    
    var body: some View {
        VStack() {
            quoteOpeningImage
                .font(.system(size: 60))
            Spacer()
            Text(text)
            Spacer()
            quoteClosingImage
                .font(.system(size: 60))
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
