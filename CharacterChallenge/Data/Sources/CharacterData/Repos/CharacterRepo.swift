//
//  CharacterRepo.swift
//
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import CoreDomain
import CharacterDomain
public struct CharacterRepo: CharactersRepoProtocol {
    private let dataSource: CharacterDataSourceProtocol

    public init(dataSource: CharacterDataSourceProtocol) {
        self.dataSource = dataSource
    }

    public func getListing(
        _ input: GetCharacterRepoInput
    ) async -> Result<CharactersListResponse, CharacterError> {
        await dataSource.getListing(input)
    }

    public func getDetails(
        _ input: GetCharacterDetailRepoInput
    ) async -> Result<CharacterDetails, CharacterError> {
        await dataSource.getDetails(input)
    }
}
