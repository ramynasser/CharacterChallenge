//
//  CharacterRepo.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
public typealias GetCharacterRepoInput = GetCharacterUseCaseInput
public typealias GetCharacterDetailRepoInput = GetCharacterDetailUseCaseInput
public protocol CharactersRepoProtocol {
    func getListing(_ input: GetCharacterRepoInput
    ) async -> Result<CharactersListResponse,
                      CharacterError>
    
    func getDetails(_ input: GetCharacterDetailRepoInput
    ) async -> Result<CharacterDetails,
                      CharacterError>
}
