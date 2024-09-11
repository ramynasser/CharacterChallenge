//
//  File.swift
//  
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
public protocol GetCharacterUseCaseInputProtocol: Pagable {
}

public protocol Pagable {
    var page: Int { get set }
}

public struct GetCharacterUseCaseInput: GetCharacterUseCaseInputProtocol {
    public var page: Int

    public init(page: Int = 1) {
        self.page = page
    }
}
