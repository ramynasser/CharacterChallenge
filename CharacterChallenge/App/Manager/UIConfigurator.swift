//
//  UIConfigurator.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 13/09/2024.
//

import Foundation
import Logger
import Core
import UIKit

class UIConfigurator: AppDelegateManagable {
    static var shared: AppDelegateManagable = DataConfigurator()

    func setup() {
        let font = fonts.body.small
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(colors.primary)]
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: font]
    }
}
