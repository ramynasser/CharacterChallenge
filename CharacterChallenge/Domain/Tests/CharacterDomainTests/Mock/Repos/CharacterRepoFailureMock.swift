//
//  CharacterRepoFailureMock.swift
//
//
//  Created by Ramy Nasser on 15/09/2024.
//

import Foundation
import Foundation
@testable import CoreDomain
@testable import CharacterDomain

struct CharacterRepoFailureMock: CharactersRepoProtocol {
    func getListing(_ input: GetCharacterRepoInput
    ) async -> Result<CharactersListResponse, CharacterError> {
        .failure(.unknown)
    }

    func getDetails(_ input: GetCharacterDetailRepoInput
    ) async -> Result<CharacterDetails, CharacterError> {
        .failure(.unknown)
    }
}
