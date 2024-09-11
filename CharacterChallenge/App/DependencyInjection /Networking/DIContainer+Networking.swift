//
//  DIContainer+Networking.swift
//  YassirTask
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import Networking
import ConfigData

extension Container: NetworkingConfigProtocol {
    static var networkManager: NetworkManagerProtocol {
        let remoteResponseHandler = NetworkResponseHandler(
          decoder: JSONDecoder(),
          encoder: JSONEncoder()
        )

        let networkManager = NetworkManager(
            responseHandler: remoteResponseHandler,
            authProvider: AuthManager.shared,
            logger: nil
          )

        return networkManager
    }
}
