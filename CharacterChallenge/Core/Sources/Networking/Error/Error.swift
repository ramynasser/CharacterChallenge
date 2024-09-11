//
//  AppError.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
/// An enum which holds a different type for network failure reasons .
public enum FailureReason: Error, Equatable {
    case offline
    case networkError
    case notFound
    case urlNotFound
    case noContent
    case timeout
    case conflict
    case unauthorized
    case badRequest
    case serverError
    case sessionExpired
    case tooManyRequests
    case serverMaintenance
    case preconditionRequired
    case unknown
    case invalidError
    case missingUrl
    case encodingFailed
    case other(statusCode: Int)
}

public enum NetworkRequestError<D: Decodable>: Error, Equatable {
    public static func == (lhs: NetworkRequestError<D>, rhs: NetworkRequestError<D>) -> Bool {
        return lhs.localizedDescription == rhs.localizedDescription
    }
    case appError(error: D)
    case failure(reason: FailureReason)
}
