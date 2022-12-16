//
//  ExpandedQuoteView.swift
//  CiteIt
//
//  Created by Роман Ломтев on 16.12.2022.
//

import SwiftUI

struct ExpandedQuoteView: View {
    
    var namespace: Namespace.ID
    var id: Int
    
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
                    .matchedGeometryEffect(id: "topQuotations\(id)", in: namespace)
                Spacer()
            }
            
            
            Spacer()
            
            Text(quoteVo.quote.text)
                .lineSpacing(10)
                .frame(alignment: .top)
                .tracking(5)
                .padding(20)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.custom("Organic Peach DEMO", size: 30))
                //.matchedGeometryEffect(id: "text\(id)", in: namespace)
            
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
                    .matchedGeometryEffect(id: "bottomQuotations\(id)", in: namespace)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(quoteVo.color)
                .matchedGeometryEffect(id: "background\(id)", in: namespace)
        )
    }
}
