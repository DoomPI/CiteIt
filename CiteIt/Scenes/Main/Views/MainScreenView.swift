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
    
    @Namespace
    private var namespace
    
    @State
    private var quotesViewModel = Model.GetQuotesList.ViewModel.empty
    
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
                
                ZStack {
                    
                    ScrollView(showsIndicators: false) {
                        
                        HStack {
                            QuotesStackView(
                                namespace: namespace,
                                quotesViewModel: $quotesViewModel
                            )
                            Spacer()
                        }
                        .padding(20)
                        .onTapGesture {
                            withAnimation(.default.speed(0.75)) {
                                isExpanded.toggle()
                            }
                        }
                    }
                    
                    if (isExpanded) {
                        ExpandedQuoteView(
                            namespace: namespace,
                            id: 0,
                            quoteVo: quotesViewModel.quotesList[quotesViewModel.quotesList.endIndex - 1]
                        )
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }
                    }
                }
            }
        }
        .onReceive(observedObject.$quotesViewModel) { newQuoteViewModel in
            self.quotesViewModel = newQuoteViewModel
        }
    }
    
    func showQuotesList(quoteViewModel: Model.GetQuotesList.ViewModel) {
        self.observedObject.quotesViewModel = quoteViewModel
    }
}
