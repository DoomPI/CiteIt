//
//  QuotesModel.swift
//  CiteIt
//
//  Created by Роман Ломтев on 27.10.2022.
//

import Foundation

enum QuotesListModel {
    
    enum GetQuotesList {
        struct Request {}
        struct Response {
            var qoutesList: [Quote]
        }
        struct ViewModel {
            var quotesList: [Quote]
        }
    }
    
    struct Quote: Decodable {
        let text: String
        let author: String
        
        enum CodingKeys: String, CodingKey {
            case text = "q"
            case author = "a"
        }
    }
    
    struct QuotesList: Decodable {
        let quotes: [Quote]
    }
}
