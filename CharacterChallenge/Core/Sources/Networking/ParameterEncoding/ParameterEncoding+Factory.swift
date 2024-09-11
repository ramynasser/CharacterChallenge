//
//  ParameterEncoding.swift
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
public extension ParameterEncoding {
    func encode<E: Decodable>(
        errorType: E.Type,
        urlRequest: inout URLRequest,
        bodyParameters: NetworkHTTPParameters?,
        urlParameters: NetworkHTTPParameters?
    ) throws {
        do {
            switch self {
            case .url:
                guard let urlParameters = urlParameters else { return }
                let encoder = DataParameterUrlEncoder<E>()
                try encoder.encode(urlRequest: &urlRequest, with: urlParameters)

            case .json:
                if let bodyParameters = bodyParameters, !bodyParameters.isEmpty {
                    let encoder = JSONParameterEncoder<E>()
                    try encoder.encode(urlRequest: &urlRequest, with: bodyParameters)
                }

            case .query:
                guard let urlParameters = urlParameters else { return }
                let encoder = URLParameterEncoder<E>()
                try encoder.encode(urlRequest: &urlRequest, with: urlParameters)

            case .httpBody:
                guard let bodyParameters = bodyParameters else { return }
                let encoder = DataParameterEncoder<E>()
                try encoder.encode(urlRequest: &urlRequest, with: bodyParameters)
            }
        } catch {
            throw error
        }
    }
}
