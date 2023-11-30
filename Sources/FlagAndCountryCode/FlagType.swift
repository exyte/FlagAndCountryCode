//
//  FlagStyle.swift
//  CountryFlag
//
//  Created by vadim.vitkovskiy on 21.11.2023.
//

import Foundation

public enum FlagType: Int, CaseIterable {
    /**
     Rectangle of 21 x 15 points with rounded corners.
     */
    case roundedRect

    /**
     Square of 15 x 15 points with rounded corners.
     */
    case square

    /**
     Circular flag of 15 x 15 points.
     */
    case circle

    public var size: CGSize {
        switch self {
        case .roundedRect:
            return CGSize(width: 21, height: 15)
        case .square, .circle:
            return CGSize(width: 15, height: 15)
        }
    }
}
