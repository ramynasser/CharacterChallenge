//
//  AppTheme.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation

public struct AppTheme {
    public var fonts: AppFontStyleProtocol
    public var designSystem: DesignSystemModel

    public init(
        fonts: AppFontStyleProtocol,
        designSystem: DesignSystemModel
    ) {
        self.fonts = fonts
        self.designSystem = designSystem
    }
}
public protocol AppFontStyleProtocol {
    var fontNames: [String] { get }
}
