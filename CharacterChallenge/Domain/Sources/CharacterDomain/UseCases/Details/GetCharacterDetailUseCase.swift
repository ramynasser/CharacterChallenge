//
//  File.swift
//  
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation

import Foundation

/// Protocol defining the contract for fetching character details use case
///
/// This protocol provides an abstraction for the use case responsible
/// for executing the logic to fetch detailed information for a character.
public protocol GetCharacterDetailUseCaseProtocol {

    /// Executes the use case to fetch details for a specific character
    ///
    /// This method triggers the fetching of detailed information for a character
    /// based on the provided input, which includes parameters such as the character ID.
    ///
    /// - Parameter input: The input parameters needed to fetch character details.
    /// - Returns: A `Result` containing either `CharacterDetails` on success
    ///   or `CharacterError` on failure.
    func execute(
        input: GetCharacterDetailUseCaseInput
    ) async -> Result<CharacterDetails, CharacterError>
}

/// Implementation of the `GetCharacterDetailUseCaseProtocol`
///
/// This struct is responsible for implementing the business logic to fetch
/// character details by interacting with a repository that conforms to
/// `CharactersRepoProtocol`.
public struct GetCharacterDetailUseCase: GetCharacterDetailUseCaseProtocol {
    
    /// The repository used to fetch character details
    ///
    /// This repository is injected via the initializer and will be used to
    /// communicate with the data source for fetching character details.
    private let repo: CharactersRepoProtocol

    /// Initializes the use case with a specific character repository
    ///
    /// - Parameter repo: A repository that conforms to `CharactersRepoProtocol`,
    ///   which will handle the data-fetching logic.
    public init(repo: CharactersRepoProtocol) {
        self.repo = repo
    }

    /// Executes the use case to fetch detailed information for a specific character
    ///
    /// This method uses the provided repository to asynchronously fetch character
    /// details based on the given input.
    ///
    /// - Parameter input: The input required for the use case (e.g., character ID).
    /// - Returns: A `Result` containing either the `CharacterDetails` object on success
    ///   or a `CharacterError` in case of failure.
    public func execute(
        input: GetCharacterDetailUseCaseInput
    ) async -> Result<CharacterDetails, CharacterError> {
        await repo.getDetails(input)
    }
}
