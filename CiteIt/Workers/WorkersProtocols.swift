//
//  WorkersProtocols.swift
//  CiteIt
//
//  Created by Роман Ломтев on 27.10.2022.
//

import Foundation

protocol NetworkWorking {
    
    func sendRequest(to: URL, params: [String: String]?, completion: @escaping (Data?) -> Void) async
}

protocol PersistenceWorking {
    
    func write(to path: URL, data: Data) async
    
    func read(from path: URL) async -> Data?
}
