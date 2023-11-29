// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "FlagAndCountryCode",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "FlagAndCountryCode",
            targets: ["FlagAndCountryCode"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FlagAndCountryCode",
            dependencies: []
        ),
    ]
)
