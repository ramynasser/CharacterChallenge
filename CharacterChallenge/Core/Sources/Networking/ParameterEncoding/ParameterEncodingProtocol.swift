//
//  ParameterEncodingProtocol.swift
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
public protocol ParameterEncodingProtocol {
    func encode(urlRequest: inout URLRequest, with parameters: NetworkHTTPParameters) throws
}
