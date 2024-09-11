//
//  CoreDomain.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation

protocol UseCase {
    associatedtype Input
    associatedtype ReturnType
    associatedtype ReturnErrorType: Error

    func execute(_ input: Input) async -> Result<ReturnType, ReturnErrorType>
}

public protocol DecodableFromDTO {
    associatedtype DTO: Decodable
    init(from dto: DTO)
}
