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
            red: .random(in: Constants.minColorValue...Constants.maxColorValue),
            green: .random(in: Constants.minColorValue...Constants.maxColorValue),
            blue: .random(in: Constants.minColorValue...Constants.maxColorValue)
        )
    }
}
