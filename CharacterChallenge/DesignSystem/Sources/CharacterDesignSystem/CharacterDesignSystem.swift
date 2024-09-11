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
    primary: Color(hex: "F2C94C"),
    secondary: Color(hex: "333333"),
    white: Color(hex: "FFFFFF"),
    black: Color(hex: "000000"),
    primaryGray: Color(hex: "3A3F47"),
    secondaryGray: Color(hex: "92929D"),
    darkGray: Color(hex: "3A3F47"),
    dangor: Color(hex: "690000"),
    blue: Color(hex: "0296E5")
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
    small: 10,
    medium: 20,
    large: 30
)
let characterSizes = SizeValueContainer(
    small: 10,
    medium: 20,
    large: 30
)
let characterDesignSystem = DesignSystemModel(
    colors: characterColor,
    fonts: characterFont,
    padding: characterPadding,
    size: characterSizes
)

class FontStyle: AppFontStyleProtocol {
    var fontNames: [String] = notoSansFonts
}

public var apptheme = AppTheme(
    fonts: FontStyle(),
    designSystem: characterDesignSystem
)
