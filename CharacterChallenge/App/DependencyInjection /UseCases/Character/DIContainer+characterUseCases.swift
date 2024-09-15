//
//  DIContainer+characterUseCases.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 11/09/2024.
//

import ConfigData
import Foundation
import CharacterDomain
import CharacterData

extension Container {
    static var getCharacterListUseCase: GetCharacterListUseCaseProtocol {
        return GetCharacterListUseCase(repo: DIContainer.charactersRepo)
    }

    static var getCharacterDetailUseCase: GetCharacterDetailUseCaseProtocol {
        return GetCharacterDetailUseCase(repo: DIContainer.charactersRepo)
    }
}
