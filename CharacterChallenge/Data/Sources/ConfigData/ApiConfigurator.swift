//
//  ApiConfigurator.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation

/// A singleton class responsible for configuring and providing API-related settings.
public final class ApiConfigurator {
    /// The shared instance of `ApiConfigurator`.
    static var shared: ApiConfigurator?

    /// The base URL used for API requests.
    public let baseURL: URL

    /// The version of the API being used.
    public let apiVersion: String?

    /// Initializes an `ApiConfigurator` instance with the specified configuration type.
    ///
    /// - Parameter config: A type conforming to `ApiConfigProtocol` that provides API configuration details.
    fileprivate init(_ config: ApiConfigProtocol.Type) {
        self.baseURL = config.baseURL
        self.apiVersion = config.apiVersion
    }
}

/// A protocol defining the configuration details for API access.
public protocol ApiConfigProtocol {
    /// The base URL used for API requests.
    static var baseURL: URL { get }

    /// The version of the API being used.
    static var apiVersion: String? { get }
}

public extension ApiConfigProtocol {
    /// The default API version is `nil` if not specified.
    static var apiVersion: String? { nil }
}

/// Sets up the `ApiConfigurator` with the specified API configuration.
///
/// - Parameter config: A type conforming to `ApiConfigProtocol` that provides API configuration details.
public func setup(apiConfig config: ApiConfigProtocol.Type) {
    ApiConfigurator.shared = ApiConfigurator(config)
}

/// Provides the shared `ApiConfigurator` instance.
///
/// - Returns: The shared `ApiConfigurator` instance.
/// - FatalError: Throws a fatal error if the configuration has not been set.
public var apiConfig: ApiConfigurator {
    if let config = ApiConfigurator.shared {
        return config
    } else {
        fatalError("Please set the Config for \(Bundle(for: ApiConfigurator.self))")
    }
}
