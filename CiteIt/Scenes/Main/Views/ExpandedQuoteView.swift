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
    
    @State
    private var image = Image(systemName: "photo")
    
    @State
    private var sharePreview = SharePreview("", image: Image(systemName: "square.and.arrow.up"))
    
    @State
    private var shareText = Text("")
    
    @Environment(\.displayScale)
    private var displayScale
    
    private let size = UIScreen.main.bounds.size
    
    @State
    private var viewDidLoad = false
    
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
            
            ShareLink(
                item: image,
                message: shareText,
                preview: sharePreview
            ) {
                Image(systemName: "square.and.arrow.up.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60)
                    .foregroundColor(.white)
            }
            
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
        .onAppear {
            render()
        }
    }
    
    @MainActor
    private func render() {
        DispatchQueue.main.async {
            let renderer = ImageRenderer(
                content: ShareQuoteView(
                    quoteVo: quoteVo
                )
                .frame(width: size.width * 0.75, height: size.height * 0.5)
                .cornerRadius(20)
            )
            
            renderer.scale = displayScale
            
            if let uiImage = renderer.uiImage,
               let data = uiImage.pngData(),
               let renderedImage = UIImage(data: data) {
                image = Image(uiImage: renderedImage)
            }
            
            sharePreview = SharePreview(
                quoteVo.quote.text,
                image: Image(systemName: "square.and.arrow.up")
            )
        }
    }
}
