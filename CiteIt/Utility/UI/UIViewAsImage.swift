//
//  UIViewAsImage.swift
//  CiteIt
//
//  Created by Роман Ломтев on 06.11.2022.
//

import UIKit

extension UIView {
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
