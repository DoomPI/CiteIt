//
//  StartScreenWorker.swift
//  CiteIt
//
//  Created by Роман Ломтев on 06.11.2022.
//

import Foundation

class StartScreenWorker: StartScreenWorkingLogic {
    
    private let networkWorker = NetworkWorker.shared
    private let persistenceWorker = PersistenceWorker.shared
    
    private let decoder = JSONDecoder()
    private let quotesListURL = URL(string: "https://zenquotes.io/api/random")!
    
    private let quotesListPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("randomQuote.json")
    
    func getRandomQuote(_ request: Model.RandomQuote.Request,
                        didSucceed: @escaping (Model.RandomQuote.Response) -> (),
                        didFail: @escaping () -> ()
    ) {
        
        Task {
            await networkWorker.sendRequest(to: quotesListURL, params: nil) { [weak self] networkData in
                if let data = networkData,
                   let quotesList = try?
                    self?.decoder.decode(
                        Model.RandomQuote.Response.self,
                        from: data
                    ) {
                    DispatchQueue.main.async {
                        didSucceed(quotesList)
                    }
                    Task { [weak self] in
                        self?.saveQuotesList(data: data)
                    }
                } else {
                    DispatchQueue.main.async {
                        didFail()
                    }
                }
            }
        }
    }
    
    func loadRandomQuote(completion: @escaping (Model.RandomQuote.Response) -> ()) {
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
