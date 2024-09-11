//
//  File.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
import SwiftUI

public class DesignSystemModel {
    public let colors: ColorValueContainer
    public let fonts: FontValueContainer
    public let padding: PaddingValueContainer
    public let size: SizeValueContainer
    
    public init(
        colors: ColorValueContainer,
        fonts: FontValueContainer,
        padding: PaddingValueContainer,
        size: SizeValueContainer
    ) {
        self.colors = colors
        self.fonts = fonts
        self.padding = padding
        self.size = size
    }
}
public struct PaddingValueContainer {
    public let small: CGFloat
    public let medium: CGFloat
    public let large: CGFloat
    public init(small: CGFloat, medium: CGFloat, large: CGFloat) {
        self.small = small
        self.medium = medium
        self.large = large
    }
}
public struct SizeValueContainer {
    public let small: CGFloat
    public let medium: CGFloat
    public let large: CGFloat
    public init(small: CGFloat, medium: CGFloat, large: CGFloat) {
        self.small = small
        self.medium = medium
        self.large = large
    }
}

public struct FontValueContainer {
    public let body: FontSize
    public let utility: FontSize
    public let headline: FontSize
    public init(body: FontSize, utility: FontSize, headline: FontSize) {
        self.body = body
        self.utility = utility
        self.headline = headline
    }
}
public struct FontSize {
    public let small: Typography
    public let medium: Typography
    public let large: Typography
    public init(small: Typography, medium: Typography, large: Typography) {
        self.small = small
        self.medium = medium
        self.large = large
    }
}

public struct ColorValueContainer {
    public let primary: Color
    public let secondary: Color
    public let white: Color
    public let black: Color
    public let primaryGray: Color
    public let secondaryGray: Color
    public let darkGray: Color
    public let dangor: Color
    public let blue: Color
    
    public init(
        primary: Color,
        secondary: Color,
        white: Color,
        black: Color,
        primaryGray: Color,
        secondaryGray: Color,
        darkGray: Color,
        dangor: Color,
        blue: Color
    ) {
        self.primary = primary
        self.secondary = secondary
        self.white = white
        self.black = black
        self.primaryGray = primaryGray
        self.secondaryGray = secondaryGray
        self.darkGray = darkGray
        self.dangor = dangor
        self.blue = blue
    }
}
public struct Typography {
    public let lineHeight: CGFloat
    public let fontWeight: CGFloat
    public let fontSize: CGFloat
    public let fontFamily: String
    
    
    public init(
        lineHeight: CGFloat,
        fontWeight: CGFloat,
        fontSize: CGFloat,
        fontFamily: String
    ) {
        self.lineHeight = lineHeight
        self.fontWeight = fontWeight
        self.fontSize = fontSize
        self.fontFamily = fontFamily
    }
}
