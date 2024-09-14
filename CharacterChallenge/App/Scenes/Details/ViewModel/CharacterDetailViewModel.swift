//
//  CharacterDetailViewModel.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 14/09/2024.
//

import Foundation
import CharacterDomain
import Combine
import DesignSystem

/// ViewModel responsible for managing the state and business logic for displaying character details.
final class CharacterDetailViewModel: LoadableObject {
    
    /// The current state of the view, representing different loading or content states.
    @Published var state: ViewState<CharacterModel> = .idle
    
    /// The use case responsible for fetching the character's details.
    private let useCase: GetCharacterDetailUseCaseProtocol
    
    /// A set of cancellables for managing Combine subscriptions.
    private var cancellables = Set<AnyCancellable>()
    
    /// The ID of the character whose details are to be fetched.
    private var characterId: Int

    /// Initializes the ViewModel with a use case and character ID.
    ///
    /// - Parameters:
    ///   - useCase: The use case responsible for fetching character details.
    ///   - characterId: The ID of the character whose details will be retrieved.
    init(useCase: GetCharacterDetailUseCaseProtocol, characterId: Int) {
        self.useCase = useCase
        self.characterId = characterId
    }

    /// Initiates loading of character details.
    func load() {
        Task {
            await self.fetchCharacterDetails()
        }
    }

    /// Fetches character details from the use case.
    func fetchCharacterDetails() async {
        // Set the state to loading before fetching details.
        await MainActor.run {
            state = .loading
        }
        
        let input = GetCharacterDetailUseCaseInput(id: characterId)
        let result = await useCase.execute(input: input)
        
        // Process the result and update the state accordingly.
        await MainActor.run {
            map(charactersResponse: result)
        }
    }

    /// Maps the response from the use case to the view's state.
    ///
    /// - Parameter charactersResponse: The result from fetching character details, containing either success or failure.
    func map(charactersResponse: Result<CharacterDetails, CharacterError>) {
        switch charactersResponse {
        case let .success(response):
            // Create a `CharacterModel` from the `CharacterDetails` response.
            let model = CharacterModel(
                id: response.id ?? 0,
                name: response.name ?? "",
                species: response.species ?? "",
                location: response.location?.name ?? "",
                gender: response.gender ?? "",
                status: response.status ?? .unknown,
                image: response.image ?? ""
            )
            // Update the state with the loaded character model.
            DispatchQueue.main.async {
                self.state = .loaded(model)
            }
        case .failure:
            // Handle failure and set the state to failed.
            state = .failed(CharacterError.unknown)
        }
    }
}
