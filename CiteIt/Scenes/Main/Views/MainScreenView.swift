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
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical) {
                
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
                    
                    QuotesStackView()
                        .environmentObject(observedObject)
                }
            }
            .padding(20)
            .navigationBarItems(trailing:(
                Button(action: {
                    withAnimation {
                        
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            ))
            
        }
    }
    
    func showQuotesList(quoteViewModel: Model.GetQuotesList.ViewModel) {
        self.observedObject.quotesViewModel = quoteViewModel
    }
}
