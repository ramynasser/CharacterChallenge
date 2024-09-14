//
//  CharacterRepoSuccessMock.swift
//
//
//  Created by Ramy Nasser on 15/09/2024.
//

import Foundation
@testable import CoreDomain
@testable import CharacterDomain

struct CharacterRepoSuccessMock: CharactersRepoProtocol {
    func getListing(_ input: GetCharacterRepoInput
    ) async -> Result<CharactersListResponse, CharacterError> {
        return .success(charactersListSuccessResponseMock)
    }

    func getDetails(_ input: GetCharacterDetailRepoInput
    ) async -> Result<CharacterDetails, CharacterError> {
        return .success(charactersDetailSuccessResponseMock)
    }
}
