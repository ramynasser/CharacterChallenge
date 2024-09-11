//
//  AuthorizationType.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
/// An enum which holds a different type for authorization type .
public enum AuthorizationType: Equatable {
    /// A request with no additional authorization data.
    case none
    /// A request with authorization token required.
    case token
    /// A request with operation token required , i.e used for one time passcode.
    case operationToken(token: String)
    /// A request with access token required , i.e used for special access.
    case accessToken(token: String)
}

public extension AuthorizationType {
    var key: String {
        switch self {
        case .none:
            return ""
        case .token:
            return "Authorization"
        case .operationToken:
            return "operationToken"
        case .accessToken:
            return "x-special-access-token"
        }
    }

    var prefix: String? {
        switch self {
        case .token:
            return "Bearer"
        default:
            return nil
        }
    }
}
