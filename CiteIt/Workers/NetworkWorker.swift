//
//  NetworkWorker.swift
//  CiteIt
//
//  Created by Роман Ломтев on 27.10.2022.
//

import Foundation

struct NetworkWorker: NetworkWorking {
    
    // MARK: - Shared
    static let shared = NetworkWorker()
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Internal vars
    private let session = URLSession.shared
    
    // MARK: - Public methods
    func sendRequest(to url: URL, params: [String: String]?, completion: @escaping (Data?) -> Void) async {
        return await Task {
            let task = session.dataTask(with: url) { data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        completion(data)
                    }
                } else {
                    print("Could not get any content")
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            }

            task.resume()
        }.value
    }
}
