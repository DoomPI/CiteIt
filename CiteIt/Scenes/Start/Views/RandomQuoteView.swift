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
    
    var body: some View {
        Text(observedObject.quoteText
        ).foregroundColor(.white)
    }
}

struct RandomQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        RandomQuoteView()
    }
}
