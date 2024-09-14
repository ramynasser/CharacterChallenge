// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "CoreDomain",
            targets: ["CoreDomain"]),
        .library(
            name: "CharacterDomain",
            targets: ["CharacterDomain"])
    ],
    dependencies: [
        .package(name: "Core",
                 path: "../Core")
    ],
    targets: [
        .target(
            name: "CoreDomain"
        ),
        .target(
            name: "CharacterDomain",
            dependencies: [
                .target(name: "CoreDomain")
            ]
        ),
        .testTarget(
            name: "CharacterDomainTests",
            dependencies: ["CharacterDomain"]
        )

    ]
)
