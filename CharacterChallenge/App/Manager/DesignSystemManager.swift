//
//  DesignSystemManager.swift
//  YassirTask
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
import CharacterDesignSystem
import DesignSystem
import Core

struct DesignSystemConfigurator: AppDelegateManagable {
    static var shared: AppDelegateManagable = DesignSystemConfigurator()

    private init () {}
    func setup() {
        Fiber.shared.setupTheme(theme: CharacterDesignSystem.apptheme)
    }
}
let colors = Fiber.shared.colors
let fonts = Fiber.shared.fonts
let fiberPadding = Fiber.shared.padding
let size = Fiber.shared.size
let fiberCornerRadius = Fiber.shared.cornerRadius
let fiberBorders = Fiber.shared.borders
