//
//  ColorUtils.swift
//  CiteIt
//
//  Created by Роман Ломтев on 12.12.2022.
//

import SwiftUI

class ColorUtils {
    
    private enum Constants {
        static let minColorValue: CGFloat = 0
        static let maxColorValue: CGFloat = 1
    }
    
    static func generateRandomColor() -> Color {
        return Color(
            red: add(.random(in: Constants.minColorValue..<Constants.maxColorValue),
                toComponent: -0.1
            ),
            green: add(.random(in: Constants.minColorValue..<Constants.maxColorValue),
                toComponent: -0.1
            ),
            blue: add(.random(in: Constants.minColorValue..<Constants.maxColorValue),
                toComponent: -0.1
            )
        )
    }
    
    private static func add(_ value: CGFloat, toComponent: CGFloat) -> CGFloat {
        return max(0, min(1, toComponent + value))
    }
}
