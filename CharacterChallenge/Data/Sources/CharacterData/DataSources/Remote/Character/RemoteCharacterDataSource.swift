//
//  RemoteCharacterDataSource.swift
//
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import CharacterDomain
import Networking

/// Protocol for character data sources that provides methods
/// to fetch character listings and details.
///
/// Any class or struct conforming to this protocol must implement
/// methods to fetch a list of characters as well as character details.
public protocol CharacterDataSourceProtocol {

    /// Fetches a list of characters from the data source.
    ///
    /// - Parameter input: The input parameters required for fetching the
    ///   character list, such as page and filter criteria.
    /// - Returns: A `Result` containing either the list of characters or an error.
    func getListing(
        _ input: GetCharacterRepoInput
    ) async -> Result<CharactersListResponse, CharacterError>

    /// Fetches character details from the data source.
    ///
    /// - Parameter input: The input parameters required for fetching the character details,
    ///   primarily the character ID.
    /// - Returns: A `Result` containing either the character details or an error.
    func getDetails(
        _ input: GetCharacterDetailRepoInput
    ) async -> Result<CharacterDetails, CharacterError>
}

/// Remote implementation of the `CharacterDataSourceProtocol` that fetches
/// character data from a network API using a `NetworkManagerProtocol`.
///
/// This struct is responsible for handling API requests to retrieve character
/// listings and character details by communicating with an external API.
public struct RemoteCharacterDataSource: CharacterDataSourceProtocol {

    /// The networking manager that performs network requests.
    ///
    /// This object conforms to `NetworkManagerProtocol` and is responsible for
    /// making HTTP requests to fetch character data from the backend.
    private let networkingManger: NetworkManagerProtocol

    /// Initializes the data source with a network manager.
    ///
    /// - Parameter networkingManger: An instance of `NetworkManagerProtocol`
    ///   that handles the network requests.
    public init(networkingManger: NetworkManagerProtocol) {
        self.networkingManger = networkingManger
    }

    /// Fetches a list of characters from the remote API.
    ///
    /// This method makes an API request using the networking manager to fetch
    /// a paginated list of characters. The result is then mapped to a domain model
    /// (`CharactersListResponse`) or an appropriate error (`CharacterError`).
    ///
    /// - Parameter input: The input object containing parameters such as page number and filter status.
    /// - Returns: A `Result` containing either a `CharactersListResponse` or a `CharacterError`.
    public func getListing(
        _ input: GetCharacterRepoInput
    ) async -> Result<CharactersListResponse, CharacterError> {
        let endpoint = CharacterEndpoint.listing(page: input.page, status: input.status)
        let result: Result<CharactersListResponse.DTO, NetworkRequestError<CharacterError.DTO>>
        result = await networkingManger.executeRequest(endpoint, appErrors: nil).result
        
        // Handling the result from the network request
        switch result {
        case let .success(dto):
            // Maps the response DTO to the domain model `CharactersListResponse`
            return .success(CharactersListResponse(from: dto))
        case let .failure(error):
            // Maps the error DTO to the domain model `CharacterError`
            switch error {
            case let .appError(dto):
                return .failure(CharacterError(from: dto))
            case .failure:
                return .failure(CharacterError.unknown)
            }
        }
    }

    /// Fetches character details from the remote API.
    ///
    /// This method makes an API request using the networking manager to fetch
    /// detailed information for a specific character based on the character ID.
    /// The result is mapped to a domain model (`CharacterDetails`) or an appropriate error.
    ///
    /// - Parameter input: The input object containing the character ID.
    /// - Returns: A `Result` containing either `CharacterDetails` or a `CharacterError`.
    public func getDetails(
        _ input: GetCharacterDetailRepoInput
    ) async -> Result<CharacterDetails, CharacterError> {
        let endpoint = CharacterEndpoint.details(id: input.id)
        let result: Result<CharacterDetails.DTO, NetworkRequestError<CharacterError.DTO>>
        result = await networkingManger.executeRequest(endpoint, appErrors: nil).result
        
        // Handling the result from the network request
        switch result {
        case let .success(dto):
            // Maps the response DTO to the domain model `CharacterDetails`
            return .success(CharacterDetails(from: dto))
        case let .failure(error):
            // Maps the error DTO to the domain model `CharacterError`
            switch error {
            case let .appError(dto):
                return .failure(CharacterError(from: dto))
            case .failure:
                return .failure(CharacterError.unknown)
            }
        }
    }
}
