//
//  LogEngines.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation

public enum Logger: CaseIterable {
    case systemLogger

    public var engine: LogsEngineProtocol {
        switch self {
        case .systemLogger:
            return SystemLogger.main
        }
    }
}
