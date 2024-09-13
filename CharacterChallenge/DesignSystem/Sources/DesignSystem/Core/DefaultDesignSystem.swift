//
//  DesignSystemTypes.swift
//
//
//  Created by Yousef Alaa on 01/11/2023.
//

import Foundation
import SwiftUI
let defaultColor = ColorValueContainer(
    primary: Color(hex: "170341"),
    secondary: Color(hex: "504974"),
    white: Color(hex: "FFFFFF"),
    black: Color(hex: "000000"),
    primaryGray: Color(hex: "C3C0D1"),
    secondaryGray: Color(hex: "827C9C"),
    darkGray: Color(hex: "61CBF4"),
    dangor: Color(hex: "FBE7EB"),
    primaryBlue: Color(hex: "EBF6FB"),
    secondaryBlue: Color(hex: "EBF6FB")
)
let defaultFont = FontValueContainer(
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
let defaultPadding = PaddingValueContainer(
    xSmall: 5,
    small: 10,
    medium: 15,
    large: 25,
    xLarge: 30
)
let defaultCornerRadius = PaddingValueContainer(
    xSmall: 5, 
    small: 10,
    medium: 15,
    large: 25,
    xLarge: 30
)
let defaultSizes = SizeValueContainer(
    small: 50,
    medium: 120,
    large: 130,
    xlarge: 240
)
let defaultBorder = SizeValueContainer(
    small: 1,
    medium: 2,
    large: 3,
    xlarge: 4
)
let defaultDesignSystem = DesignSystemModel(
    colors: defaultColor,
    fonts: defaultFont,
    padding: defaultPadding,
    cornerRadius: defaultCornerRadius,
    size: defaultSizes, 
    border: defaultBorder
)
