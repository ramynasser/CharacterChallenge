//
//  CharacterDesignSystem.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
import DesignSystem
import SwiftUI
let characterColor = ColorValueContainer(
    primary: Color(hex: "170341"),
    secondary: Color(hex: "504974"),
    white: Color(hex: "FFFFFF"),
    black: Color(hex: "000000"),
    primaryGray: Color(hex: "C3C0D1"),
    secondaryGray: Color(hex: "827C9C"),
    dangor: Color(hex: "FBE7EB"),
    primaryBlue: Color(hex: "EBF6FB"),
    secondaryBlue: Color(hex: "62CBF4")
)

let characterFont = FontValueContainer(
    body: FontSize(
        small: Typography(
            lineHeight: 1.4,
            fontWeight: 500,
            fontSize: 12.8,
            fontFamily: "Noto Sans"
        ),
        medium: Typography(
            lineHeight: 1.4,
            fontWeight: 500,
            fontSize: 20,
            fontFamily: "Noto Sans"
        ),
        large: Typography(
            lineHeight: 1.4,
            fontWeight: 500,
            fontSize: 25,
            fontFamily: "Noto Sans"
        )
    ),
    utility: FontSize(
        small: Typography(
            lineHeight: 1.4,
            fontWeight: 500,
            fontSize: 12.8,
            fontFamily: "Noto Sans"
        ),
        medium: Typography(
            lineHeight: 1.4,
            fontWeight: 600,
            fontSize: 16,
            fontFamily: "Noto Sans"
        ),
        large: Typography(
            lineHeight: 1.4,
            fontWeight: 600,
            fontSize: 12.8,
            fontFamily: "Noto Sans"
        )
    ),
    headline: FontSize(
        small: Typography(
            lineHeight: 1.4,
            fontWeight: 500,
            fontSize: 16,
            fontFamily: "Noto Sans"
        ),
        medium: Typography(
            lineHeight: 1.4,
            fontWeight: 600,
            fontSize: 20,
            fontFamily: "Noto Sans"
        ),
        large: Typography(
            lineHeight: 1.4,
            fontWeight: 600,
            fontSize: 25,
            fontFamily: "Noto Sans"
        )
    )
)
let characterPadding = PaddingValueContainer(
    xSmall: 5,
    small: 10,
    medium: 16,
    large: 25,
    xLarge: 30
)
let characterSizes = SizeValueContainer(
    small: 50,
    medium: 120,
    large: 130,
    xlarge: 300
)
let characterCornerRadius = PaddingValueContainer(
    xSmall: 5,
    small: 10,
    medium: 15,
    large: 25,
    xLarge: 30
)
let characterBorder = SizeValueContainer(
    small: 1,
    medium: 2,
    large: 3,
    xlarge: 4
)
let characterDesignSystem = DesignSystemModel(
    colors: characterColor,
    fonts: characterFont,
    padding: characterPadding, 
    cornerRadius: characterCornerRadius,
    size: characterSizes,
    border: characterBorder
)

class FontStyle: AppFontStyleProtocol {
    var fontNames: [String] = notoSansFonts
}

public var apptheme = AppTheme(
    fonts: FontStyle(),
    designSystem: characterDesignSystem
)
