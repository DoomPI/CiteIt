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
    
    @Environment(\.displayScale) var displayScale
    
    private let quotesStackView = QuotesStackView()
    private let size = UIScreen.main.bounds.size
    
    @State
    private var image = Image(systemName: "photo")
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Cite it")
                                .font(.largeTitle)
                            Text("Today's quotes:")
                                .font(.subheadline)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    
                    quotesStackView
                        .environmentObject(observedObject)
                    
                    ShareLink(
                        item: image,
                        message: Text("Никита"),
                        preview: SharePreview(Text("Никита"), image: Image(systemName: "square.and.arrow.up"))
                    )
                    
                }
                .padding(20)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                }
            }
            .onAppear {
                render()
            }
        }
    }
    
    func showQuotesList(quoteViewModel: Model.GetQuotesList.ViewModel) {
        self.observedObject.quotesViewModel = quoteViewModel
    }
    
    @MainActor
    private func render() {
        let renderer = ImageRenderer(content: FullQuoteView(
            quoteVo: Model.GetQuotesList.ViewObject(
                quote: QuotesModel.Quote(
                    text: "Cite it",
                    author: "Somebody"
                )
            )
        )
            .frame(width: size.width * 0.75, height: size.height * 0.5)
        )
        
        renderer.scale = displayScale
        
        if let uiImage = renderer.uiImage,
           let data = uiImage.pngData(),
           let renderedImage = UIImage(data: data) {
            image = Image(uiImage: renderedImage)
        }
    }
}
