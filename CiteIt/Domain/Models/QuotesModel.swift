//
//  QuotesModel.swift
//  CiteIt
//
//  Created by Роман Ломтев on 27.10.2022.
//

import Foundation

enum QuotesModel {
    
    enum GetQuotesList {
        struct Request {}
        struct Response {
            var qoutesList: [Quote]
        }
        struct ViewModel {
            var quotesList: [Quote]
        }
    }
    
    enum GetQuoteOfTheDay {
        struct Request {}
        struct Response {
            var quote: [Quote]
        }
        struct ViewModel {
            var quote: Quote
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
}
