//
//  GetCharacterListUseCase.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//
import Foundation

/// Protocol defining the contract for fetching a list of characters use case
///
/// This protocol provides an abstraction for the use case responsible for
/// executing the logic to fetch a list of characters based on the provided input.
public protocol GetCharacterListUseCaseProtocol {

    /// Executes the use case to fetch a list of characters
    ///
    /// This method triggers the fetching of a character list based on the
    /// provided input, which may include parameters like pagination or filters.
    ///
    /// - Parameter input: The input parameters needed to fetch the character list.
    /// - Returns: A `Result` containing either `CharactersListResponse` on success
    ///   or `CharacterError` on failure.
    func execute(
        input: GetCharacterUseCaseInput
    ) async -> Result<CharactersListResponse, CharacterError>
}

/// Implementation of the `GetCharacterListUseCaseProtocol`
///
/// This struct is responsible for implementing the business logic to fetch
/// a list of characters by interacting with a repository that conforms to
/// `CharactersRepoProtocol`.
public struct GetCharacterListUseCase: GetCharacterListUseCaseProtocol {

    /// The repository used to fetch the list of characters
    ///
    /// This repository is injected via the initializer and will be used to
    /// communicate with the data source for fetching the character list.
    private let repo: CharactersRepoProtocol

    /// Initializes the use case with a specific character repository
    ///
    /// - Parameter repo: A repository that conforms to `CharactersRepoProtocol`,
    ///   which will handle the data-fetching logic for listing characters.
    public init(repo: CharactersRepoProtocol) {
        self.repo = repo
    }

    /// Executes the use case to fetch a list of characters
    ///
    /// This method uses the provided repository to asynchronously fetch a list
    /// of characters based on the given input.
    ///
    /// - Parameter input: The input required for the use case (e.g., pagination, filters).
    /// - Returns: A `Result` containing either the `CharactersListResponse` object on success
    ///   or a `CharacterError` in case of failure.
    public func execute(input: GetCharacterUseCaseInput) async -> Result<CharactersListResponse, CharacterError> {
        await repo.getListing(input)
    }
}
