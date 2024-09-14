// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v15), .macOS(.v12)],

    products: [
        .library(
            name: "ConfigData",
            targets: ["ConfigData"]),
        .library(
            name: "CharacterData",
            targets: ["CharacterData"])
    ],
    dependencies: [
        .package(
            name: "Core",
            path: "../Core"),
        .package(
            name: "Domain",
            path: "../Domain")
    ],
    targets: [
        .target(
            name: "ConfigData",
            dependencies: [
                .product(name: "Networking", package: "Core")
            ]
        ),
        .target(
            name: "CharacterData",
            dependencies: [
                .product(name: "CharacterDomain", package: "Domain"),
                .target(name: "ConfigData"),
                .product(name: "Networking", package: "Core")
            ]
        ),
        .testTarget(
            name: "ConfigDataTests",
            dependencies: ["ConfigData"]),
        .testTarget(
            name: "CharacterDataTests",
            dependencies: ["CharacterData"])
    ]
)
