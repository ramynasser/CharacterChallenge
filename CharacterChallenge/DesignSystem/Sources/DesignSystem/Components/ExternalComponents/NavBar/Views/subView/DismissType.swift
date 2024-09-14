//
//  DismissType.swift
//
//
//  Created by Ramy Nasser on 14/09/2024.
//

import Foundation
public enum DismissType {
    case back
    case close
    case custom(icon: String, dismissAction: (() -> Void)? = nil)
    case none
}

public extension DismissType {

    var dismissAction: (() -> Void)? {
        switch self {
        case let .custom(_, dismissAction):
            return dismissAction
        default:
            return nil
        }
    }
}
