//
//  GetCharacterUseCaseTests.swift
//
//
//  Created by Ramy Nasser on 15/09/2024.
//

import Foundation
@testable import CoreDomain
@testable import CharacterDomain
import XCTest

final class GetCharacterUseCaseTests: XCTestCase {
    var repoSuccessMock: CharacterRepoSuccessMock!
    var repoFailedMock: CharacterRepoFailureMock!

    var getCharacterListUseCase: GetCharacterListUseCase!

    override func setUpWithError() throws {
        repoSuccessMock = CharacterRepoSuccessMock()
        repoFailedMock = CharacterRepoFailureMock()
    }

    override func tearDownWithError() throws {
        repoSuccessMock = nil
        repoFailedMock = nil
        getCharacterListUseCase = nil
    }

    func testGetCharactersSuccess() async throws {
        getCharacterListUseCase = GetCharacterListUseCase(repo: repoSuccessMock)

        let result = await getCharacterListUseCase.execute(
            input: GetCharacterUseCaseInput(
                page: 1
            )
        )

        // Assert
        switch result {
        case let .success(model):
            XCTAssertEqual(model.results.count, 3)
            XCTAssertEqual(model.results.first?.name, "name1")
            XCTAssertEqual(model.results.last?.name, "name3")
        case .failure:
            // Handle the failure case
            XCTFail("Unexpected failure")
        }
    }

    func testGetCharactersFailed() async throws {
        getCharacterListUseCase = GetCharacterListUseCase(repo: repoFailedMock)

        let result = await getCharacterListUseCase.execute(
            input: GetCharacterUseCaseInput(
                page: 1
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
