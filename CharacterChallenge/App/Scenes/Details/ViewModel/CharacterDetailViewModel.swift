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
final class CharacterDetailViewModel: LoadableObject {
    @Published var state: ViewState<CharacterModel> = .idle
    private let useCase: GetCharacterDetailUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    private var characterId: Int

    init(useCase: GetCharacterDetailUseCaseProtocol, characterId: Int) {
        self.useCase = useCase
        self.characterId = characterId
    }

    func load() {
        Task {
            await self.fetchCharacterDetails()
        }
    }

    func fetchCharacterDetails() async {
        await MainActor.run {
            state = .loading
        }
        let input = GetCharacterDetailUseCaseInput(id: characterId)
        let result = await useCase.execute(input: input)
        await MainActor.run {
            map(charactersResponse: result)
        }
    }

    func map(charactersResponse: Result<CharacterDetails, CharacterError>) {
        switch charactersResponse {
        case let .success(response):
            let model = CharacterModel(
                id: response.id ?? 0,
                name: response.name ?? "",
                species: response.species ?? "",
                location: response.location?.name ?? "",
                gender: response.gender ?? "",
                status: response.status ?? .unknown,
                image: response.image ?? ""
            )
            DispatchQueue.main.async {
                self.state = .loaded(model)
            }
        case .failure:
            state = .failed(CharacterError.unknown)
        }
    }
}
