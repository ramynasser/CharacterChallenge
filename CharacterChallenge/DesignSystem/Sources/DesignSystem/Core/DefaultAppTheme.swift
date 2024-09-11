//
//  DefaultDesignSystem.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
import SwiftUI

class DefaultAppFontStyle: AppFontStyleProtocol {
    var fontNames: [String] = notoSansFonts
}

var defaultApptheme = AppTheme(
    fonts: DefaultAppFontStyle(),
    designSystem: defaultDesignSystem
)
