//
//  DataParameterUrlEncoder.swift
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
public struct DataParameterUrlEncoder<E: Decodable>: ParameterEncodingProtocol {
    public func encode(urlRequest: inout URLRequest, with parameters: NetworkHTTPParameters) throws {
        urlRequest.httpBody = Data(urlEncoded(formDataSet: parameters).utf8)
        if urlRequest.value(
            forHTTPHeaderField: NetworkConstants.contentTypeHeaderName
        ) == nil {
            urlRequest.setValue(
                NetworkConstants.formTypeHeader,
                forHTTPHeaderField: NetworkConstants.contentTypeHeaderName
            )
        }
    }

    func urlEncoded(formDataSet: NetworkHTTPParameters) -> String {
        return formDataSet.map { key, value in
            key + "=\(value)"
        }
        .joined(separator: "&")
    }
}
