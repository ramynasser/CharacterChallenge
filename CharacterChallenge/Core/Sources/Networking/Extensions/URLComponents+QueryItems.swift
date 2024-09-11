//
//  URLComponents+QueryItems.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
extension URLComponents {
    mutating func setQueryItems(with parameters: [String: Any]) {
        queryItems = parameters.map {
            URLQueryItem(
                name: $0.key,
                value: "\($0.value)")
        }
    }
}
