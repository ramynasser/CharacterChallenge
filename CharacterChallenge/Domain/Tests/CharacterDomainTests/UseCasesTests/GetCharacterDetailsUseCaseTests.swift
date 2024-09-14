//
//  File.swift
//  
//
//  Created by Ramy Nasser on 15/09/2024.
//

import Foundation
import Foundation
@testable import CoreDomain
@testable import CharacterDomain
import XCTest

final class GetCharacterDetailsUseCaseTests: XCTestCase {
    var repoSuccessMock: CharacterRepoSuccessMock!
    var repoFailedMock: CharacterRepoFailureMock!

    var getCharacterDetailsUseCase: GetCharacterDetailUseCase!

    override func setUpWithError() throws {
        repoSuccessMock = CharacterRepoSuccessMock()
        repoFailedMock = CharacterRepoFailureMock()
    }

    override func tearDownWithError() throws {
        repoSuccessMock = nil
        repoFailedMock = nil
        getCharacterDetailsUseCase = nil
    }

    func testGetCharactersSuccess() async throws {
        getCharacterDetailsUseCase = GetCharacterDetailUseCase(repo: repoSuccessMock)

        let result = await getCharacterDetailsUseCase.execute(
            input: GetCharacterDetailRepoInput(
                id: 1
            )
        )

        // Assert
        switch result {
        case let .success(model):
            XCTAssertEqual(model.name, "name1")
        case .failure:
            // Handle the failure case
            XCTFail("Unexpected failure")
        }
    }

    func testGetCharactersFailed() async throws {
        getCharacterDetailsUseCase = GetCharacterDetailUseCase(repo: repoFailedMock)

        let result = await getCharacterDetailsUseCase.execute(
            input: GetCharacterDetailRepoInput(
                id: 1
            )
        )

        switch result {
        case .success:
            XCTFail("Unexpected failure")
        case let .failure(failure):
            XCTAssertEqual(
                failure.localizedDescription,
                CharacterError.unknown.localizedDescription
            )
        }
    }
}
