//
//  RemoteCharacterDataSource.swift
//
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import CharacterDomain
import Networking

public protocol CharacterDataSourceProtocol {
    func getListing(
        _ input: GetCharacterRepoInput
    ) async -> Result<CharactersListResponse, CharacterError>
    func getDetails(
        _ input: GetCharacterDetailRepoInput
    ) async -> Result<CharacterDetails, CharacterError>
}
public struct RemoteCharacterDataSource: CharacterDataSourceProtocol {
    private let networkingManger: NetworkManagerProtocol
   
    public init(networkingManger: NetworkManagerProtocol) {
        self.networkingManger = networkingManger
    }
    
    public func getListing(
        _ input: GetCharacterRepoInput
    ) async -> Result<CharactersListResponse, CharacterError> {
        let endpoint = CharacterEndpoint.listing(page: input.page, status: input.status)
        let result: Result<CharactersListResponse.DTO, NetworkRequestError<CharacterError.DTO>>
        result = await networkingManger.executeRequest(endpoint,
                                                       appErrors: nil).result
        switch result {
        case let .success(dto):
            return .success(CharactersListResponse(from: dto))
        case let .failure(error):
            switch error {
            case let .appError(dto):
                return .failure(CharacterError(from: dto))
            case .failure:
                return .failure(CharacterError.unknown)
            }
        }
    }
    
    public func getDetails(
        _ input: GetCharacterDetailRepoInput
    ) async -> Result<CharacterDetails, CharacterError> {
        let endpoint = CharacterEndpoint.details(id: input.id)
        let result: Result<CharacterDetails.DTO, NetworkRequestError<CharacterError.DTO>>
        result = await networkingManger.executeRequest(endpoint,
                                                       appErrors: nil).result
        switch result {
        case let .success(dto):
            return .success(CharacterDetails(from: dto))
        case let .failure(error):
            switch error {
            case let .appError(dto):
                return .failure(CharacterError(from: dto))
            case .failure:
                return .failure(CharacterError.unknown)
            }
        }
    }
    
}
