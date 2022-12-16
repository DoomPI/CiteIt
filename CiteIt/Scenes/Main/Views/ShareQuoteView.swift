//
//  FullQuoteView.swift
//  CiteIt
//
//  Created by Роман Ломтев on 13.12.2022.
//

import SwiftUI

struct ShareQuoteView: View {
    
    let quoteOpeningImage = Image(
        systemName: "quote.opening"
    )
    let quoteClosingImage = Image(
        systemName: "quote.closing"
    )
    
    var quoteVo: Model.GetQuotesList.ViewObject
    
    var body: some View {
        VStack {
            
            HStack {
                quoteOpeningImage
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                Spacer()
            }
            
            
            Spacer()
            
            Text(quoteVo.quote.text)
                .lineSpacing(10)
                .frame(alignment: .top)
                .tracking(5)
                .padding(5)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.custom("Organic Peach DEMO", size: 30))
            
            Spacer()
            
            HStack {
                Spacer()
                Text(quoteVo.quote.author)
                    .tracking(5)
                    .foregroundColor(.white)
                    .font(.custom("Organic Peach DEMO", size: 20))
                    .padding(.trailing, 10)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                quoteClosingImage
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
        }
        .padding(20)
        .background(quoteVo.color)
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct FullQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        ShareQuoteView(
            quoteVo: Model.GetQuotesList.ViewObject(
                quote: QuotesModel.Quote(
                    text: "Cite it",
                    author: "Somebody"
                )
            )
        
        )
    }
}
