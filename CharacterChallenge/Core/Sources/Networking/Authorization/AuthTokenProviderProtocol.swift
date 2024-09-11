//
//  AuthTokenProviderProtocol.swift
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
public typealias JWT = String
/// A protocol which is used by the network layer to use the authentication token when needed.
public protocol AuthTokenProviderProtocol {
    var bearerToken: JWT? {get set}
    var refreshToken: JWT? {get set}
}
