//
//  CountryFlag.swift
//  CountryFlag
//
//  Created by vadim.vitkovskiy on 21.11.2023.
//

import Foundation

#if canImport(SwiftUI)
import SwiftUI

extension CountryFlagInfo {
    /// Get a specific image from assets depending on the image type
    /// - Parameter type: Image display type: FlagType
    /// - Returns: SwiftUI flag image
    public func getCountryImage(with type: FlagType = .roundedRect) -> some View {
        let image = Image(countryCode, bundle: CountryFlags.assetBundle)
        return image.applyFlagType(type)
    }
}
#endif

#if canImport(UIKit)
import UIKit

extension CountryFlagInfo {
    /// Get a specific image from assets depending on the image type
    /// - Parameter type: Image display type: FlagType
    /// - Returns: UIKit flag image
    public func getCountryImage(with type: FlagType = .roundedRect) -> UIImage? {
        guard let image = UIImage(named: countryCode, in: CountryFlags.assetBundle, compatibleWith: nil) else {
            return nil
        }

        return image.applyFlagType(type)
    }
}
#endif

extension CountryFlagInfo {
    public static var all: [CountryFlagInfo] {
        guard let data = CountryFlagsParser().getParsedData() else {
            return []
        }

        return data
    }
}

extension CountryFlagInfo {
    public static var defaultValue: CountryFlagInfo {
        Self(countryCode: "AU", countryName: "Australia", countryDialCode: "+61")
    }
}

public struct CountryFlagInfo: Decodable, Hashable {
    /**
     Country 2 letter code
     */
    public let countryCode: String

    /**
     Country name
     */
    public let countryName: String

    /**
     Country dial-code
     */
    public let countryDialCode: String

    enum CodingKeys: String, CodingKey {
        case countryCode = "code"
        case countryName = "name"
        case countryDialCode = "dial_code"
    }
}

