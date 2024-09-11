//
//  URLParameterEncoder.swift
//  
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
/// A struct which is used in encoding url parameters into encoded query.
public struct URLParameterEncoder<E: Decodable>: ParameterEncodingProtocol {
    public func encode(urlRequest: inout URLRequest, with parameters: NetworkHTTPParameters) throws {
        guard let url = urlRequest.url else {
            throw NetworkRequestError<E>.failure(reason: .missingUrl)
        }
        guard var urlComponents = URLComponents(
            url: url,
            resolvingAgainstBaseURL: false),
            !parameters.isEmpty else { return }
        urlComponents.setQueryItems(with: parameters)
        urlRequest.url = urlComponents.url
        if urlRequest.value(
            forHTTPHeaderField: NetworkConstants.contentTypeHeaderName
        ) == nil {
            urlRequest.setValue(
                NetworkConstants.jsonTypeHeader,
                forHTTPHeaderField: NetworkConstants.contentTypeHeaderName
            )
        }
    }
}
