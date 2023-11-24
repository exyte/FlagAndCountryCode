//
//  FlagType+Extensions.swift
//  Example
//
//  Created by vadim.vitkovskiy on 24.11.2023.
//

import CountryFlag

extension FlagType {
    var displayName: String {
        switch self {
        case .roundedRect:
            return "Rect"
        case .square:
            return "Square"
        case .circle:
            return "Circle"
        }
    }
}
