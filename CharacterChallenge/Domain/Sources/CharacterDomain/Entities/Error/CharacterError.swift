//
//  CharacterError.swift
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
import CoreDomain

public enum CharacterError: AppErrorProtocol {
    case encoding
    case error(message: String)
    case unknown
}
