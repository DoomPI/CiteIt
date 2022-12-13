//
//  StringExt.swift
//  CiteIt
//
//  Created by Роман Ломтев on 12.12.2022.
//

import Foundation

extension String {
    
    func divideIntoLines(charsPerLine: Int) -> String {
        var i = 0
        var quoteText = self
        
        while i < count {
            let left = index(startIndex, offsetBy: i)
            if (i + charsPerLine - 1 < count) {
                let right = index(startIndex, offsetBy: i + charsPerLine - 1)
                let substr = self[left...right]
                if let spaceIndex = substr.lastIndex(of: " ") {
                    quoteText = quoteText.replacingCharacters(in: spaceIndex...spaceIndex, with: "\n")
                }
                
                i += charsPerLine
            } else {
                break
            }
        }
        
        return quoteText
    }
}
