//
//  LoggerManager.swift
//  YassirTask
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import Logger
import Core

struct LoggerConfigurator: AppDelegateManagable {
    static var shared: AppDelegateManagable = LoggerConfigurator()

    func setup() {
        LogsManager.shared.initialize(engines: [Logger.systemLogger.engine])
    }
}
