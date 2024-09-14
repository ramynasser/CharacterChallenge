//
//  CharacterRepo.swift
//
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import CoreDomain
import CharacterDomain

/// A repository for managing character-related data.
public struct CharacterRepo: CharactersRepoProtocol {
    /// The data source used to fetch character data.
    private let dataSource: CharacterDataSourceProtocol

    /// Initializes a new `CharacterRepo` instance with the specified data source.
    ///
    /// - Parameter dataSource: An instance conforming to `CharacterDataSourceProtocol` used to fetch character data.
    public init(dataSource: CharacterDataSourceProtocol) {
        self.dataSource = dataSource
    }

    /// Fetches a list of characters.
    ///
    /// - Parameter input: An instance of `GetCharacterRepoInput` containing parameters for the request.
    /// - Returns: A `Result` containing either a `CharactersListResponse` on success or a `CharacterError` on failure.
    public func getListing(
        _ input: GetCharacterRepoInput
    ) async -> Result<CharactersListResponse, CharacterError> {
        await dataSource.getListing(input)
    }

    /// Fetches detailed information about a specific character.
    ///
    /// - Parameter input: An instance of `GetCharacterDetailRepoInput` containing parameters for the request.
    /// - Returns: A `Result` containing either a `CharacterDetails` on success or a `CharacterError` on failure.
    public func getDetails(
        _ input: GetCharacterDetailRepoInput
    ) async -> Result<CharacterDetails, CharacterError> {
        await dataSource.getDetails(input)
    }
}
