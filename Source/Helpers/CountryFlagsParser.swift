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
    public func getParsedData() -> [CountryFlag] {
        guard let jsonPath = Bundle(for: Self.self).path(forResource: "country-codes", ofType: "json") else { return [] }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
            return try JSONDecoder().decode([CountryFlag].self, from: data)
        } catch {
            print(error)
        }
        return []
    }
}
