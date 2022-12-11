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
        typealias Response = [Quote]
        struct ViewModel {
            static let empty = ViewModel(quotesList: [])
            
            var quotesList: [Quote]
        }
    }
    
    enum GetQuoteOfTheDay {
        struct Request {}
        typealias Response = [Quote]
        struct ViewModel {
            var quote: Quote
        }
    }
    
    enum GetRandomQuote {
        struct Request {}
        typealias Response = [Quote]
        struct ViewModel: Equatable {
            static let empty = ViewModel(quote: Quote(
                text: "",
                author: ""
            ))
            var quote: Quote
            
            static func ==(left: ViewModel, right: ViewModel) -> Bool {
                return left.quote == right.quote
            }
        }
    }
    
    struct Quote: Decodable, Hashable, Equatable {
        let text: String
        let author: String
        
        static func ==(left: Quote, right: Quote) -> Bool {
            return left.text == right.text
            && left.author == right.author
        }
        
        enum CodingKeys: String, CodingKey {
            case text = "q"
            case author = "a"
        }
    }
}
