//
//  ResponseHandler+response.swift
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
let startNumber = 200
let endNumber = 299
let numberRange = startNumber ... endNumber

public extension ResponseHandler {
    func handleResponse<T: Decodable, E: Decodable>(
        responeInfo: ResponseInfo
    )
    -> Result<T, NetworkRequestError<E>> {
        switch responeInfo.statusCode {
        case numberRange:
            return successHandler.handle(
                requestInfo: responeInfo
            )
        default:
            let error: NetworkRequestError<E> = errorHandler.handle(
                requestInfo: responeInfo
            )
            return .failure(error)
        }
    }
}
