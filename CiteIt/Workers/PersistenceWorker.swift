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
    
    func write(json: Data) async {
        return await Task(priority: .background, operation: { () -> Void in
            do {
                if let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let fileURL = documentsURL.appendingPathComponent("quotes.json")
                    try json.write(to: fileURL, options: .atomic)
                }
            } catch { }
        }).value
    }
    
    func read() async -> Data? {
        return await Task(priority: .background, operation: { () -> Data? in
            if let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let filePath = documentsURL.appendingPathComponent("quotes.json").path
                if FileManager.default.fileExists(
                    atPath: filePath),
                    let data = FileManager.default.contents(atPath: filePath) {
                    return data
                }
            }
            
            return nil
        }).value
    }
}
