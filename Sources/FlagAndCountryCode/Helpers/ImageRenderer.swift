//
//  UIImage.swift
//  CountryFlag
//
//  Created by vadim.vitkovskiy on 21.11.2023.
//


#if canImport(UIKit)
import UIKit

internal extension UIImage {
    func rendereredImage(size outputSize: CGSize, action: (UIGraphicsImageRendererContext) -> Void) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = scale

        let renderer = UIGraphicsImageRenderer(size: outputSize, format: format)
        return renderer.image(actions: { (context) in
            action(context)

            // Draw a centered image using the renderer
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
        self.rendereredImage(size: type.size) { (context) in
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
        }
    }
}

#endif

#if canImport(SwiftUI)
import SwiftUI

internal extension Image {
    @ViewBuilder
    func applyFlagType(_ type: FlagType) -> some View {
        switch type {
        case .circle:
            self
                .frame(width: type.size.width, height: type.size.height)
                .clipShape(Circle())
        case .square:
            self
                .frame(width: type.size.width, height: type.size.height)
                .clipShape(Rectangle())
        case .roundedRect:
            self
                .frame(width: type.size.width, height: type.size.height)
                .clipShape(RoundedRectangle(cornerRadius: 2))
        }
    }
}

#endif
