//
//  FlagType+Extensions.swift
//  Example
//
//  Created by vadim.vitkovskiy on 24.11.2023.
//

import FlagAndCountryCode

extension FlagType {
    var displayName: String {
        switch self {
        case .roundedRect:
            return "Rectangle"
        case .square:
            return "Square"
        case .circle:
            return "Circle"
        }
    }
}
