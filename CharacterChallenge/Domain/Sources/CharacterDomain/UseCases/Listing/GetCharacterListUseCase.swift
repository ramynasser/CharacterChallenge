//
//  GetCharacterListUseCase.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
public protocol GetCharacterListUseCaseProtocol {
    func execute(
        input: GetCharacterUseCaseInput
    ) async -> Result<CharactersListResponse, CharacterError>
}
public struct GetCharacterListUseCase: GetCharacterListUseCaseProtocol {
    private let repo: CharactersRepoProtocol

    public init(repo: CharactersRepoProtocol) {
        self.repo = repo
    }

    public func execute(input: GetCharacterUseCaseInput) async -> Result<CharactersListResponse, CharacterError> {
        await repo.getListing(input)
    }
}
