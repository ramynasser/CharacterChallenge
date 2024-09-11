//
//  ApiConfigurator.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation

public final class ApiConfigurator {
    static var shared: ApiConfigurator?

    public let baseURL: URL
    public let apiVersion: String?

    fileprivate init(_ config: ApiConfigProtocol.Type) {
        self.baseURL = config.baseURL
        self.apiVersion = config.apiVersion
    }
}

public protocol ApiConfigProtocol {
    static var baseURL: URL { get }
    static var apiVersion: String? { get }
}
public extension ApiConfigProtocol {
    static var apiVersion: String? { nil }
}
public func setup(apiConfig config: ApiConfigProtocol.Type) {
    ApiConfigurator.shared = ApiConfigurator(config)
}

public var apiConfig: ApiConfigurator {
    if let config = ApiConfigurator.shared {
        return config
    } else {
        fatalError("Please set the Config for \(Bundle(for: ApiConfigurator.self))")
    }
}
