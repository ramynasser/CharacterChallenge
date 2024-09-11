//
//  JSONParameterEncoder.swift
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
/// A struct which is used in encoding body parameters to json data
public struct JSONParameterEncoder<E: Decodable>: ParameterEncodingProtocol {
    public func encode(urlRequest: inout URLRequest, with parameters: NetworkHTTPParameters) throws {
        do {
            let jsonData = try JSONSerialization.data(
                withJSONObject: serializedParameters(parameters),
                options: .prettyPrinted
            )
            urlRequest.httpBody = jsonData
            let contentTypeHeaderName = NetworkConstants.contentTypeHeaderName
            if urlRequest.value(forHTTPHeaderField: contentTypeHeaderName) == nil {
                urlRequest.setValue(
                    NetworkConstants.jsonTypeHeader,
                    forHTTPHeaderField: contentTypeHeaderName
                )
            }
        } catch {
            throw NetworkRequestError<E>.failure(reason: .encodingFailed)
        }
    }

    func encoded(urlRequest: inout URLRequest, encodable: Encodable, encoder: JSONEncoder = JSONEncoder()) throws {
        do {
            let encodable = AnyEncodable(encodable)
            urlRequest.httpBody = try encoder.encode(encodable)

            let contentTypeHeaderName = NetworkConstants.contentTypeHeaderName
            if urlRequest.value(forHTTPHeaderField: contentTypeHeaderName) == nil {
                urlRequest.setValue(
                    NetworkConstants.jsonTypeHeader,
                    forHTTPHeaderField: contentTypeHeaderName
                )
            }

        } catch {
            throw NetworkRequestError<E>.failure(reason: .encodingFailed)
        }
    }

    func serializedParameters(_ parameters: NetworkHTTPParameters) -> [String: Any] {
        var serializedParameters: [String: Any] = [:]
        for (key, component) in parameters {
            serializedParameters[key] = component
        }

        return serializedParameters
    }
}
