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
    
    func write(to path: String, data: Data) async
    
    func read(from path: String) async -> Data?
}
