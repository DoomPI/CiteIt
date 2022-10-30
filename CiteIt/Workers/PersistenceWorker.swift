//
//  PersistencyWorker.swift
//  CiteIt
//
//  Created by Роман Ломтев on 27.10.2022.
//

import Foundation

struct PersistenceWorker: PersistenceWorking {
    
    static let shared = PersistenceWorker()
    
    // MARK: - Init
    private init() {}
    
    func write(to path: String, data: Data) async {
        return await Task(priority: .background, operation: { () -> Void in
            do {
                if let url = URL(string: path) {
                    try data.write(to: url, options: .atomic)
                }
            } catch { }
        }).value
    }
    
    func read(from path: String) async -> Data? {
        return await Task(priority: .background, operation: { () -> Data? in
            if FileManager.default.fileExists(
                atPath: path),
                let data = FileManager.default.contents(atPath: path) {
                return data
            }
            
            return nil
        }).value
    }
}
