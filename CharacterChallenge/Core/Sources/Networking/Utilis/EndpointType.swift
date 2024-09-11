//
//  EndpointType.swift
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
/// An enum which holds a types of endpoint either through server or using local file.

public enum EndpointType: Equatable {
    case server
    case localFile(bundle: Bundle, fileName: String)
}
