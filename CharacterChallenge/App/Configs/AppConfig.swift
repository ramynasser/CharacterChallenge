//
//  AppConfig.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
import Logger
import ConfigData

struct AppConfig {
    var apiConfig: APIConfig

    init?() {
        guard let apiConfig = Self.getAPiConfig() else {
            return nil
        }

        self.apiConfig = apiConfig
    }

    private static func getAPiConfig() -> APIConfig? {
        return APIConfig()
    }
}
