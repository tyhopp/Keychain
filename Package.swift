// swift-tools-version: 5.5.0

import PackageDescription

let package = Package(
    name: "Keychain",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Keychain",
            targets: ["Keychain"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Keychain",
            dependencies: []),
        .testTarget(
            name: "KeychainTests",
            dependencies: ["Keychain"]),
    ]
)
