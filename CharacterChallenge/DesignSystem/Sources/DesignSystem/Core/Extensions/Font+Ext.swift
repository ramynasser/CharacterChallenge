//
//  File.swift
//  
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
import SwiftUI
public extension Font {
    static func custom(typography: Typography) -> Font {
        return .custom(Font.fontName(fontFamily: typography.fontFamily,
                                     weight: typography.fontWeight),
                       size: typography.fontSize)
    }

    static func fontName(fontFamily: String,
                         weight: CGFloat) -> String {
        var fontName = fontFamily.replacingOccurrences(of: " ", with: "")
        var fontWeight = ""

        switch weight {
        case 100: fontWeight = "Thin"
        case 200: fontWeight = "ExtraLight"
        case 300: fontWeight = "Light"
        case 400: fontWeight = "Regular"
        case 500: fontWeight = "Medium"
        case 600: fontWeight = "Semibold"
        case 700: fontWeight = "Bold"
        case 800: fontWeight = "ExtraBold"
        case 900: fontWeight = "Black"
        default: fontWeight = "Regular"
        }

        fontName = fontName + "-" + fontWeight
        return fontName
    }
}
