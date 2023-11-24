//
//  UIImage.swift
//  CountryFlag
//
//  Created by vadim.vitkovskiy on 21.11.2023.
//

import UIKit

internal extension UIImage {
    func rendereredImage(size outputSize: CGSize, action: (UIGraphicsImageRendererContext) -> Void) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = scale
        
        let renderer = UIGraphicsImageRenderer(size: outputSize, format: format)
        return renderer.image(actions: { (context) in
            action(context)
            
            // Draw image centered in the renderer
            let bounds = context.format.bounds
            let rect = CGRect(x: (bounds.size.width - size.width) / 2,
                              y: (bounds.size.height - size.height) / 2,
                              width: size.width, height: size.height)
            self.draw(in: rect)
        })
    }
}

internal extension UIImage {
    func applyFlagType(_ type: FlagType) -> UIImage {
        return self.rendereredImage(size: type.size, action: { (context) in
            switch type {
            case .roundedRect:
                let path = UIBezierPath(roundedRect: context.format.bounds, cornerRadius: 2)
                path.addClip()
            case .square:
                let path = UIBezierPath(rect: context.format.bounds)
                path.addClip()
            case .circle:
                let path = UIBezierPath(roundedRect: context.format.bounds, cornerRadius: type.size.width)
                path.addClip()
            }
        })
    }
}
