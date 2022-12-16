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
    
    private let randomQuoteURL = URL(string: "https://zenquotes.io/api/random")!
    private let quotesListURL = URL(string: "https://zenquotes.io/api/quotes")!
    
    private let randomQuotePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("randomQuote.json")
    private let quotesListPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("quotes.json")
    
    func getRandomQuote(_ request: Model.GetRandomQuote.Request,
                        didSucceed: @escaping (Model.GetRandomQuote.Response) -> (),
                        didFail: @escaping () -> ()
    ) {
        
        Task {
            await networkWorker.sendRequest(to: randomQuoteURL, params: nil) { [weak self] networkData in
                if let data = networkData,
                   let quotesList = try?
                    self?.decoder.decode(
                        Model.GetRandomQuote.Response.self,
                        from: data
                    ) {
                    DispatchQueue.main.async {
                        didSucceed(quotesList)
                    }
                    Task { [weak self] in
                        self?.saveRandomQuote(data: data)
                    }
                } else {
                    DispatchQueue.main.async { [weak self] in
                        self?.loadRandomQuote(didSucceed: didSucceed, didFail: didFail)
                    }
                }
            }
        }
    }
    
    func getQuotesList(_ request: Model.GetQuotesList.Request,
                       didSucceed: @escaping (Model.GetQuotesList.Response) -> (),
                       didFail: @escaping () -> ()
    ) {
        Task {
            await networkWorker.sendRequest(to: quotesListURL, params: nil) { [weak self] networkData in
                if let data = networkData,
                   let quotesList = try?
                    self?.decoder.decode(
                        Model.GetRandomQuote.Response.self,
                        from: data
                    ) {
                    DispatchQueue.main.async {
                        didSucceed(quotesList)
                    }
                    Task { [weak self] in
                        self?.saveQuotesList(data: data)
                    }
                } else {
                    DispatchQueue.main.async { [weak self] in
                        self?.loadQuotesList(didSucceed: didSucceed, didFail: didFail)
                    }
                }
            }
        }
    }
    
    func loadRandomQuote(didSucceed: @escaping (Model.GetRandomQuote.Response) -> (),
                         didFail: @escaping () -> ()
    ) {
        Task { [weak self] in
            if let data = await self?.persistenceWorker.read(from: quotesListPath),
               let quotesList = try? self?.decoder.decode([Model.Quote].self, from: data) {
                DispatchQueue.main.async {
                    didSucceed(quotesList)
                }
            } else {
                DispatchQueue.main.async {
                    didFail()
                }
            }
        }
    }
    
    func loadQuotesList(didSucceed: @escaping (Model.GetQuotesList.Response) -> (),
                        didFail: @escaping () -> ()
    ) {
        Task { [weak self] in
            if let data = await self?.persistenceWorker.read(from: quotesListPath),
               let quotesList = try? self?.decoder.decode([Model.Quote].self, from: data) {
                DispatchQueue.main.async {
                    didSucceed(quotesList)
                }
            } else {
                DispatchQueue.main.async {
                    didFail()
                }
            }
        }
    }
    
    private func saveRandomQuote(data: Data) {
        Task { [weak self] in
            await self?.persistenceWorker.write(to: randomQuotePath, data: data)
        }
    }
    
    private func saveQuotesList(data: Data) {
        Task { [weak self] in
            await self?.persistenceWorker.write(to: quotesListPath, data: data)
        }
    }
}
