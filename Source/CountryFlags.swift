//
//  CountryFlag.swift
//  CountryFlag
//
//  Created by vadim.vitkovskiy on 21.11.2023.
//

import Foundation

public class CountryFlags {
    /**
     All countries and flags from JSON
     */
    public var all: [CountryFlag] = []

    /// Parse all flags and codes from JSON object
    public init() {
        all = CountryFlagsParser().getParsedData()
    }
}
