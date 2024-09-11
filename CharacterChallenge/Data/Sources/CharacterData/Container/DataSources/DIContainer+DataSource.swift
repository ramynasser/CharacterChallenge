//
//  DIContainer+DataSource.swift
//
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import ConfigData
import CharacterDomain
public extension DIContainer {
    static var remoteCharacterDataSource: CharacterDataSourceProtocol {
        return RemoteCharacterDataSource(networkingManger: networkConfig.networkManager)
    }
}
