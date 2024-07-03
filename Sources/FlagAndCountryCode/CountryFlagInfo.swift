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
    /// Get a specific image from the assets depending on the image type
    /// - Parameter type: Image display type: FlagType
    /// - Returns: SwiftUI flag image
    public func getCountryImage(with type: FlagType = .roundedRect) -> some View {
        let image = Image(code, bundle: Bundle.current)
        return image.applyFlagType(type)
    }
}
#endif

#if canImport(UIKit)
import UIKit

extension CountryFlagInfo {
    /// Get a specific image from the assets depending on the image type
    /// - Parameter type: Image display type: FlagType
    /// - Returns: UIKit flag image
    public func getCountryImage(with type: FlagType = .roundedRect) -> UIImage? {
        guard let image = UIImage(named: code, in: Bundle.current, compatibleWith: nil) else {
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

    /**
        Native language name
     */
    public let languageNative: String

    /**
        English language name
     */
    public let languageEnglish: String

    public init(code: String,
                name: String,
                dialCode: String,
                languageNative: String,
                languageEnglish: String
    ) {
        self.code = code
        self.name = name
        self.dialCode = dialCode
        self.languageNative = languageEnglish
        self.languageEnglish = languageEnglish
    }

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case name = "name"
        case dialCode = "dial_code"
        case languageEnglish = "language_english"
        case languageNative = "language_native"
    }
}

