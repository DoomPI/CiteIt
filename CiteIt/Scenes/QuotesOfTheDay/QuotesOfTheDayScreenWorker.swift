//
//  QuotesOfTheDayScreenWorker.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.11.2022.
//

import Foundation

class QuotesOfTheDayScreenWorker {
    
    private let networkWorker = NetworkWorker.shared
    private let persistenceWorker = PersistenceWorker.shared
    
    private let decoder = JSONDecoder()
    private let quoteOfTheDayURL = URL(string: "https://zenquotes.io/api/today")!
    
    private let quotesListPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("quotesOfTheDay.json")
    
}

extension QuotesOfTheDayScreenWorker: QuotesOfTheDayScreenWorkingLogic {
    
    func getQuotes(_ request: Model.GetQuoteOfTheDay.Request, completion: @escaping ([Model.Quote]) -> ()) {
        Task {
            await networkWorker.sendRequest(to: quoteOfTheDayURL, params: nil) { [weak self] networkData in
                if let data = networkData,
                   let quotesList = try?
                    self?.decoder.decode(
                        [Model.Quote].self,
                        from: data
                    ) {
                    DispatchQueue.main.async {
                        completion(quotesList)
                    }
                }
            }
        }
    }
    
    func loadQuotes(completion: @escaping ([Model.Quote]) -> ()) {
        
    }
}
