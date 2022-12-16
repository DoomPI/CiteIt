//
//  MainScreenView.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.12.2022.
//

import SwiftUI

struct MainScreenView: View {
    
    @ObservedObject
    var observedObject: MainScreenObservable
    
    @Environment(\.displayScale) private var displayScale
    
    @State
    private var quotesViewModel = Model.GetQuotesList.ViewModel.empty
    
    private let size = UIScreen.main.bounds.size
    
    @State
    private var image = Image(systemName: "photo")
    
    @State
    private var sharePreview = SharePreview(Text("Никита"), image: Image(systemName: "square.and.arrow.up"))
    
    @State
    private var shareText = Text("Никита")
    
    @State
    private var isExpanded = false
    
    var body: some View {
        
        NavigationStack {
                
            VStack {
                
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Cite it")
                            .font(.largeTitle)
                        Text("Today's quotes:")
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding([.leading, .leading, .bottom], 20)
                .padding(.top, 40)
                
                VStack {
                    
                    if (!isExpanded) {
                        ScrollView(showsIndicators: false) {
                            HStack {
                                QuotesStackView(quotesViewModel: $quotesViewModel)
                                Spacer()
                            }
                            .padding(20)
                            
                            Spacer()
                        }
                    } else {
                        FullQuoteView(quoteVo: quotesViewModel.quotesList[
                            quotesViewModel.quotesList.endIndex - 1
                        ])
                        .frame(maxWidth: size.width, maxHeight: .infinity)
                        .cornerRadius(20)
                        .edgesIgnoringSafeArea(.all)
                        .aspectRatio(contentMode: .fill)
                    }
                }
                .onTapGesture {
                    withAnimation(.spring(
                        response: 0.6,
                        dampingFraction: 0.8
                    )) {
                        isExpanded.toggle()
                    }
                }
            }
            .onAppear {
                render()
            }
        }
        .onReceive(observedObject.$quotesViewModel) { newQuoteViewModel in
            self.quotesViewModel = newQuoteViewModel
        }
    }
    
    func showQuotesList(quoteViewModel: Model.GetQuotesList.ViewModel) {
        self.observedObject.quotesViewModel = quoteViewModel
    }
    
    @MainActor
    private func render() {
        DispatchQueue.main.async {
            let renderer = ImageRenderer(
                content: FullQuoteView(
                    quoteVo: Model.GetQuotesList.ViewObject(
                        quote: QuotesModel.Quote(
                            text: "Cite it",
                            author: "Somebody"
                        )
                    )
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
        }
    }
}
