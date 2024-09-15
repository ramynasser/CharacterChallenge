//
//  AuthManager.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import Networking
class AuthManager: AuthTokenProviderProtocol {
    static var shared: AuthManager = AuthManager()
    private init() {}
    var bearerToken: JWT?
    var refreshToken: JWT?
}
