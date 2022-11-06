//
//  MainScreenWorker.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

import Foundation

class MainScreenWorker: MainScreenWorkingLogic {
    
    private let networkWorker = NetworkWorker.shared
    private let persistenceWorker = PersistenceWorker.shared
    
    private let decoder = JSONDecoder()
    private let quotesListURL = URL(string: "https://zenquotes.io/api/quotes")!
    
    private let quotesListPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("quotes.json")
    
    func getQuotes(_ request: Model.GetQuotesList.Request, completion: @escaping ([Model.Quote]) -> ()) {
        
        Task {
            await networkWorker.sendRequest(to: quotesListURL, params: nil) { [weak self] networkData in
                if let data = networkData,
                   let quotesList = try?
                    self?.decoder.decode(
                        [Model.Quote].self,
                        from: data
                    ) {
                    DispatchQueue.main.async {
                        completion(quotesList)
                    }
                    Task { [weak self] in
                        self?.saveQuotesList(data: data)
                    }
                }
            }
        }
    }
    
    func loadQuotes(completion: @escaping ([Model.Quote]) -> ()) {
        Task { [weak self] in
            if let data = await self?.persistenceWorker.read(from: quotesListPath),
               let quotesList = try? self?.decoder.decode([Model.Quote].self, from: data) {
                DispatchQueue.main.async {
                    completion(quotesList)
                }
            }
        }
    }
    
    private func saveQuotesList(data: Data) {
        Task { [weak self] in
            await self?.persistenceWorker.write(to: quotesListPath, data: data)
        }
    }
}