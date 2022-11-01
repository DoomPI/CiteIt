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
    
    func write(to path: URL, data: Data) async {
        return await Task(priority: .background, operation: { () -> Void in
            do {
                try data.write(to: path)
            } catch {}
        }).value
    }
    
    func read(from path: URL) async -> Data? {
        return await Task(priority: .background, operation: { () -> Data? in
            if FileManager.default.fileExists(
                atPath: path.relativePath),
               let file = try? FileHandle(forReadingFrom: path) {
                return file.availableData
            }
            
            return nil
        }).value
    }
}
