//
//  AppError.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
/// A Protocol which holds info provided for each app error .
public protocol AppErrorProtocol {
    var statusCode: Int { get set }
}
