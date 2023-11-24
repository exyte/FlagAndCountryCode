//
//  CountryFlag.swift
//  CountryFlag
//
//  Created by vadim.vitkovskiy on 21.11.2023.
//

import UIKit

#if canImport(SwiftUI)
import SwiftUI

extension CountryFlag {
    /// Get a specific image from assets depending on the image type
    /// - Parameter type: Image display type: FlagType
    /// - Returns: SwiftUI flag image
    public func getCountryImage(with type: FlagType = .roundedRect) -> Image {
        guard let image = UIImage(named: countryCode, in: Bundle(for: CountryFlags.self), compatibleWith: nil) else {
            return Image("")
        }

        return Image(uiImage: image.applyFlagType(type))
    }
}
#endif

public struct CountryFlag: Decodable, Hashable {
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


    /// Get a specific image from assets depending on the image type
    /// - Parameter type: Image display type: FlagType
    /// - Returns: UIKit flag image
    public func getCountryImage(with type: FlagType = .roundedRect) -> UIImage {
        guard let image = UIImage(named: countryCode, in: Bundle(for: CountryFlags.self), compatibleWith: nil) else {
            return UIImage()
        }

        return image.applyFlagType(type)
    }

    enum CodingKeys: String, CodingKey {
        case countryCode = "code"
        case countryName = "name"
        case countryDialCode = "dial_code"
    }
}
