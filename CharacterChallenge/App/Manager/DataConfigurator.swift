//
//  DataConfigurator.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 11/09/2024.
//

import ConfigData
import Core
import Foundation

class DataConfigurator: AppDelegateManagable {
    static var shared: AppDelegateManagable = DataConfigurator()

    func setup() {
        ConfigData.setup(apiConfig: APIConfig.self)
        ConfigData.setup(networkingConfig: Container.self)
    }
}
