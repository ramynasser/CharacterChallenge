//
//  CharactersListViewModelTests.swift
//  CharacterChallengeTests
//
//  Created by Ramy Nasser on 14/09/2024.
//


import XCTest
import Combine
import CharacterDomain
@testable import CharacterChallenge
final class CharactersListViewModelTests: XCTestCase {
    private var viewModel: CharactersListViewModel!
    private var mockUseCase: MockGetCharacterListUseCase!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
        mockUseCase = MockGetCharacterListUseCase()
        viewModel = CharactersListViewModel(useCase: mockUseCase)
    }
    
    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        cancellables = nil
        super.tearDown()
    }
    
    // Test case for successfully loading characters
    
    func testLoadCharactersSuccess() async {
        // Arrange
        let expectedCharacters = [
            CharacterDetails(
                id: 1,
                name: "name",
                status: .alive,
                species: "species",
                type: "type",
                gender: "male",
                origin: nil,
                location: nil,
                image: nil,
                episode: nil,
                url: nil,
                created: nil
            ),
            CharacterDetails(
                id: 1,
                name: "name",
                status: .alive,
                species: "species",
                type: "type",
                gender: "male",
                origin: nil,
                location: nil,
                image: nil,
                episode: nil,
                url: nil,
                created: nil
            )
        ]
        mockUseCase.result = .success(CharactersListResponse(info:Info(count: 23, pages: 1, next: nil, prev: nil), results: expectedCharacters))
        
        // Act
        await viewModel.load()
        
        // Assert
        XCTAssertNotEqual(viewModel.state, .loading)
        XCTAssertFalse(viewModel.isListFullLoaded)
    }
    
    // Test case for handling empty character list
    @MainActor
    func testLoadCharactersEmpty() async {
        // Arrange
        mockUseCase = MockGetCharacterListUseCase()
        mockUseCase.result = .success(
            CharactersListResponse(
                info: Info(
                    count: 0,
                    pages: 0,
                    next: nil,
                    prev: nil
                ), results: [])
        )
        viewModel = CharactersListViewModel(useCase: mockUseCase)

        // Act
        viewModel.load()

        // Assert
        await waitForPublished(viewModel.$state, equals: .empty, within: 2)
        XCTAssertTrue(self.viewModel.characters.isEmpty)
        XCTAssertEqual(self.viewModel.state, .empty)
    }
    
    // Test case for handling failure when loading characters
    func testLoadCharactersFailure() async {
        mockUseCase = MockGetCharacterListUseCase()
        // Arrange
        mockUseCase.result = .failure(CharacterError.unknown)
        viewModel = CharactersListViewModel(useCase: mockUseCase)

        // Act
        viewModel.load()
        
        // Assert
        await waitForPublished(viewModel.$state, equals: .failed(CharacterError.unknown), within: 2)
        XCTAssertEqual(viewModel.state, .failed(CharacterError.unknown))
        XCTAssertTrue(viewModel.characters.isEmpty)
    }
}

// MARK: - Mock Classes
class MockGetCharacterListUseCase: GetCharacterListUseCaseProtocol {
    var result: Result<CharactersListResponse, CharacterError> = .failure(.unknown)
    
    func execute(input: GetCharacterUseCaseInput) async -> Result<CharactersListResponse, CharacterError> {
        return result
    }
}
