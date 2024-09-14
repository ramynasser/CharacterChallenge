////
////  CharacterDetailViewModelTests.swift
////  CharacterChallengeTests
////
////  Created by Ramy Nasser on 15/09/2024.
////
//
//import XCTest
//import CharacterDomain
//import XCTest
//import Combine
//@testable import CharacterChallenge
//
//@MainActor
//final class CharacterDetailViewModelTests: XCTestCase {
//    var viewModel: CharacterDetailViewModel!
//    var mockUseCase: MockGetCharacterDetailUseCase!
//    var cancellables: Set<AnyCancellable>!
//
//    override func setUp() {
//        super.setUp()
//        mockUseCase = MockGetCharacterDetailUseCase()
//        cancellables = []
//        viewModel = CharacterDetailViewModel(useCase: mockUseCase, characterId: 1)
//    }
//
//    override func tearDown() {
//        viewModel = nil
//        mockUseCase = nil
//        cancellables = nil
//        super.tearDown()
//    }
//
//    func testFetchCharacterDetailsSuccess() async {
//        // Arrange
//        let characterDetails = CharacterDetails(
//            id: 1,
//            name: "Rick Sanchez",
//            status: .alive,
//            species: "Human",
//            type: "",
//            gender: "Male",
//            origin: nil,
//            location: nil,
//            image: "https://example.com/image.png",
//            episode: [],
//            url: nil,
//            created: nil
//        )
//    
//        mockUseCase.result = .success(characterDetails)
//
//        viewModel = CharacterDetailViewModel(useCase: mockUseCase, characterId: 1)
//        // Act
//        viewModel.load()
//
//        await waitForPublished(viewModel.$state, equals: .empty, within: 2)
//        // Assert
//        XCTAssertEqual(viewModel.state, .loaded(CharacterModel(
//            id: 1,
//            name: "Rick Sanchez",
//            species: "Human",
//            location: "Earth",
//            gender: "Male",
//            status: .alive,
//            image: "https://example.com/image.png"
//        )))
//        XCTAssertEqual(self.viewModel.state, .empty)
//        
//    }
//
//    func testFetchCharacterDetailsFailure() async {
//
//        // Arrange
//        mockUseCase.result = .failure(.unknown)
//
//        viewModel = CharacterDetailViewModel(useCase: mockUseCase, characterId: 1)
//
//        // Act
//        viewModel.load()
//        await waitForPublished(viewModel.$state, equals: .empty, within: 2)
//
//        // Assert
//        XCTAssertEqual(viewModel.state, .failed(CharacterError.unknown))
//    }
//}
//class MockGetCharacterDetailUseCase: GetCharacterDetailUseCaseProtocol {
//    var result: Result<CharacterDetails, CharacterError>?
//
//    func execute(input: GetCharacterDetailUseCaseInput) async -> Result<CharacterDetails, CharacterError> {
//        return result ?? .failure(.unknown)
//    }
//}
