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
        guard let jsonPath = Bundle.packageModule.path(forResource: "country-codes", ofType: "json") else { return nil }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
            return try JSONDecoder().decode([CountryFlagInfo].self, from: data)
        } catch {
            return nil
        }
    }
}

import class Foundation.Bundle

private class BundleFinder {}

extension Foundation.Bundle {
    /// Returns the resource bundle associated with the current Swift module.
    static var packageModule: Bundle = {
        let bundleName = "ABUIKit_ABStyleKit"

        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: BundleFinder.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named ABUIKit_ABStyleKit")
    }()
}
