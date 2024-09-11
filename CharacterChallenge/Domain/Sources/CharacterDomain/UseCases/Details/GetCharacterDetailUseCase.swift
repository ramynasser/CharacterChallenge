//
//  File.swift
//  
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
public protocol GetCharacterDetailUseCaseProtocol {
    func execute(
        input: GetCharacterDetailUseCaseInput
    ) async -> Result<CharacterDetails, CharacterError>
}
public struct GetCharacterDetailUseCase: GetCharacterDetailUseCaseProtocol {
    private let repo: CharactersRepoProtocol

    public init(repo: CharactersRepoProtocol) {
        self.repo = repo
    }

    public func execute(
        input: GetCharacterDetailUseCaseInput
    ) async -> Result<CharacterDetails, CharacterError> {
        await repo.getDetails(input)
    }
}
