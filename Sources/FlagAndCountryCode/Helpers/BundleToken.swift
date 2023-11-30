//
//  CountryFlags.swift
//  CountryFlag
//
//  Created by vadim.vitkovskiy on 27.11.2023.
//

import Foundation

private final class BundleToken {
    static let bundle: Bundle = {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        return Bundle(for: BundleToken.self)
#endif
    }()
    private init() {}
}

public extension Bundle {
    static var current: Bundle {
        BundleToken.bundle
    }
}
