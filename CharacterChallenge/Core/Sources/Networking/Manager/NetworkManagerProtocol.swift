//
//  NetworkManagerProtocol.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Combine
import Core

public protocol NetworkManagerProtocol {
    func executeRequest<T: Decodable, E: Decodable>(
        _ endpoint: any RemoteEndpoint,
        appErrors: [any AppErrorProtocol]?
    ) async -> RemoteResponse<T, E>
}
