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
        let image = Image(code, bundle: CountryFlags.assetBundle)
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
        guard let image = UIImage(named: code, in: CountryFlags.assetBundle, compatibleWith: nil) else {
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

public struct CountryFlagInfo: Decodable, Hashable {
    /**
     Country 2 letter code
     */
    public let code: String

    /**
     Country name
     */
    public let name: String

    /**
     Country dial-code
     */
    public let dialCode: String


    public init(code: String, name: String, dialCode: String) {
        self.code = code
        self.name = name
        self.dialCode = dialCode
    }

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case name = "name"
        case dialCode = "dial_code"
    }
}

