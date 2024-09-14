//
//  CharacterRepo.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//
import Foundation

/// Typealias for input parameters for fetching character listing
///
/// This alias is used to simplify the usage of input required by
/// `GetCharacterUseCaseInput` for getting the character list.
public typealias GetCharacterRepoInput = GetCharacterUseCaseInput

/// Typealias for input parameters for fetching character details
///
/// This alias is used to simplify the usage of input required by
/// `GetCharacterDetailUseCaseInput` for getting detailed information
/// about a specific character.
public typealias GetCharacterDetailRepoInput = GetCharacterDetailUseCaseInput

/// Protocol defining the methods for interacting with the character repository
///
/// This protocol outlines the required methods for fetching character data,
/// including listing characters and fetching details for a specific character.
public protocol CharactersRepoProtocol {

    /// Fetches a list of characters based on the provided input
    ///
    /// This function is responsible for asynchronously fetching a list
    /// of characters from the repository. The input specifies the criteria
    /// for the listing (e.g., page number, filters).
    ///
    /// - Parameter input: The input parameters required to get the character listing.
    /// - Returns: A `Result` containing either `CharactersListResponse` on success
    ///   or `CharacterError` on failure.
    func getListing(_ input: GetCharacterRepoInput
    ) async -> Result<CharactersListResponse, CharacterError>

    /// Fetches detailed information for a specific character
    ///
    /// This function is responsible for asynchronously fetching details
    /// for a particular character from the repository. The input provides
    /// the necessary parameters (e.g., character ID) to identify the character.
    ///
    /// - Parameter input: The input parameters required to get the character details.
    /// - Returns: A `Result` containing either `CharacterDetails` on success
    ///   or `CharacterError` on failure.
    func getDetails(_ input: GetCharacterDetailRepoInput
    ) async -> Result<CharacterDetails, CharacterError>
}
