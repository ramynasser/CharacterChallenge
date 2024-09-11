// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "Core",
                 targets: ["Core"]),
        .library(name: "Networking",
                 targets: ["Networking"]),
        .library(name: "Logger",
                 targets: ["Logger"])
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: []
        ),
        .target(name: "Networking",
                dependencies: ["Core",
                               "Logger"]),
        .target(
            name: "Logger",
            dependencies: ["Core"]
        ),
        .testTarget(name: "CoreTests",
                    dependencies: ["Core"])
    ]
)
