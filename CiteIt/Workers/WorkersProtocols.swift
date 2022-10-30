//
//  WorkersProtocols.swift
//  CiteIt
//
//  Created by Роман Ломтев on 27.10.2022.
//

import Foundation

protocol NetworkWorking {
    
    func sendRequest(to: URL, params: [String: String]?, completion: @escaping (Data?) -> Void)
}

protocol PersistenceWorking {
    
    typealias Model = QuotesListModel.Quote
    
    func write(json: Data) async
    
    func read() async -> Data?
}
