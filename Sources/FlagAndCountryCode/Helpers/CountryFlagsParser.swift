//
//  CountryFlagsParser.swift
//  CountryFlag
//
//  Created by vadim.vitkovskiy on 21.11.2023.
//

import Foundation

public class CountryFlagsParser {
    
    /// Get country flags  from the bundled JSON
    /// - Returns: Array of CountryFlagsInfo
    public func getParsedData() -> [CountryFlagInfo]? {
        guard let jsonPath = Bundle.current.path(forResource: "country-codes", ofType: "json") else { return nil }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
            return try JSONDecoder().decode([CountryFlagInfo].self, from: data)
        } catch {
            return nil
        }
    }
}
