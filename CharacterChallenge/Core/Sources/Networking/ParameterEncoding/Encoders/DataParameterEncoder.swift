//
//  DataParameterEncoder.swift
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
/// A struct which is used in encoding body parameters to data utf8
public struct DataParameterEncoder<E: Decodable>: ParameterEncodingProtocol {
    public func encode(urlRequest: inout URLRequest, with parameters: NetworkHTTPParameters) throws {
        var urlComponents = URLComponents()
        urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        urlRequest.httpBody = urlComponents.percentEncodedQuery?.data(using: .utf8)
        if urlRequest.value(
            forHTTPHeaderField: NetworkConstants.contentTypeHeaderName
        ) == nil {
            urlRequest.setValue(
                NetworkConstants.formTypeHeader,
                forHTTPHeaderField: NetworkConstants.contentTypeHeaderName
            )
        }
    }
}
