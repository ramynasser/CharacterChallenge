// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import SwiftUI

public class Fiber {
    public static var shared = Fiber()
    private var selectedTheme: AppTheme!
    private var designSystem: DesignSystemModel!

    public var colors: ColorValueContainer { Fiber.shared.designSystem.colors }
    public var fonts: FontValueContainer { Fiber.shared.designSystem.fonts }
    public var size: SizeValueContainer { Fiber.shared.designSystem.size }
    public var padding: PaddingValueContainer { Fiber.shared.designSystem.padding }
    public var cornerRadius: PaddingValueContainer { Fiber.shared.designSystem.cornerRadius }

    private init() {
        if selectedTheme == nil {
            selectedTheme = defaultApptheme
            designSystem = defaultDesignSystem
        }
    }

    public func setupTheme(theme: AppTheme) {
        selectedTheme = theme
        designSystem = theme.designSystem
        FontsManager.loadFonts(fontNames: theme.fonts.fontNames)
    }
}
