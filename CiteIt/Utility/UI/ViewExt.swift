//
//  ViewExt.swift
//  CiteIt
//
//  Created by Роман Ломтев on 12.12.2022.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
