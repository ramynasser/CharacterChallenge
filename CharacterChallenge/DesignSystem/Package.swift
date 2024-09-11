// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
        .library(
            name: "CharacterDesignSystem",
            targets: ["CharacterDesignSystem"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DesignSystem",
            resources: [
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-Black.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-BlackItalic.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-Bold.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-BoldItalic.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-ExtraBold.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-ExtraBoldItalic.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-ExtraLight.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-ExtraLightItalic.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-Italic.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-Light.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-LightItalic.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-Medium.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-MediumItalic.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-Regular.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-SemiBold.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-SemiBoldItalic.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-Thin.ttf"),
                .copy("../DesignSystem/Resources/Fonts/NotoSans/NotoSans-ThinItalic.ttf")
            ]
        ),
        .target(name: "CharacterDesignSystem",
                dependencies: [
                    .target(name: "DesignSystem")
                ]),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"]),
    ]
)
