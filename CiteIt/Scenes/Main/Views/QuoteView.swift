//
//  QuoteView.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.12.2022.
//

import SwiftUI

struct QuoteView: View {
    
    var namespace: Namespace.ID
    
    var id: Int
    
    let quoteOpeningImage = Image(
        systemName: "quote.opening"
    )
    let quoteClosingImage = Image(
        systemName: "quote.closing"
    )
    
    var quoteVo: Model.GetQuotesList.ViewObject
    
    @Binding
    var quotesViewModel: Model.GetQuotesList.ViewModel
    
    var textPadding: CGFloat
    
    var isTextShown: Bool
    
    @State
    private var offsetX: CGFloat = 0
    
    @State
    private var rotationDegrees: CGFloat = 0
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                quoteOpeningImage
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: "topQuotations\(id)", in: namespace, properties: [])
                Spacer()
            }
            
            
            Spacer()
            
            Text(quoteVo.quote.text)
                .lineSpacing(10)
                .frame(alignment: .top)
                .tracking(5)
                .padding(textPadding)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.custom("Organic Peach DEMO", size: 20))
                .opacity(isTextShown ? 1 : 0)
                .matchedGeometryEffect(id: "text\(id)", in: namespace, properties: [])
            
            Spacer()
            
            HStack {
                Spacer()
                quoteClosingImage
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: "bottomQuotations\(id)", in: namespace, properties: [])
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(quoteVo.color)
                .matchedGeometryEffect(id: "background\(id)", in: namespace, properties: [])
        )
        .offset(x: offsetX)
        .rotationEffect(.degrees(rotationDegrees), anchor: .bottomLeading)
        .gesture(DragGesture()
            .onChanged(onChanged(value:))
            .onEnded(onEnded(value:))
        )
    }
    
    private func removeLast() {
        quotesViewModel.quotesList.removeLast()
    }
    
    private func onChanged(value: DragGesture.Value) {
        
        if value.translation.width < 0 {
            offsetX = value.translation.width
            rotationDegrees = value.translation.width / 10
        }
    }
    
    private func onEnded(value: DragGesture.Value) {
        if value.translation.width < 0
            && -value.translation.width > UIScreen.main.bounds.width / 3 {
            offsetX =  -1000
            withAnimation {
                removeLast()
            }
        } else {
            withAnimation {
                offsetX = 0
                rotationDegrees = 0
            }
        }
    }
}
