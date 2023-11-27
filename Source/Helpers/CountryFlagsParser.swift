//
//  CountryFlagsParser.swift
//  CountryFlag
//
//  Created by vadim.vitkovskiy on 21.11.2023.
//

import Foundation

public class CountryFlagsParser {

    /// Get Country-Flags  from JSON
    /// - Returns: Array of countryFlags
    public func getParsedData() -> [CountryFlagInfo]? {
        guard let jsonPath = Bundle(for: Self.self).path(forResource: "country-codes", ofType: "json") else { return nil }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
            return try JSONDecoder().decode([CountryFlagInfo].self, from: data)
        } catch {
            return nil
        }
    }
}
