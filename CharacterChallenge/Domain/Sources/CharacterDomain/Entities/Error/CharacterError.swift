//
//  CharacterError.swift
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
import CoreDomain

/// An enum which holds a different type for character failure .
public enum CharacterError: AppErrorProtocol {
    case encoding
    case error(message: String)
    case unknown
}
