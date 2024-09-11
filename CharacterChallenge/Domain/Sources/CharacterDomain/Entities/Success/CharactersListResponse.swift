//
//  CharactersListResponse.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
public struct CharactersListResponse: Codable {
    public var info: Info?
    public var results: [CharacterDetails]

    public init(
        info: Info,
        results: [CharacterDetails]
    ) {
        self.info = info
        self.results = results
    }
}
// MARK: - Info
public struct Info: Codable {
    public let count, pages: Int?
    public let next: String?
    public let prev: String?
    
    public init(
        count: Int?,
        pages: Int?,
        next: String?,
        prev: String?
    ) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}
