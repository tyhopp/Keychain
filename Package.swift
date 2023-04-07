// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Keychain",
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
