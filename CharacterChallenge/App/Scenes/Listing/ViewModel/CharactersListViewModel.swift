//
//  CharactersListViewModel.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import DesignSystem
import CharacterDomain
import Combine
final class CharactersListViewModel: LoadableObject {
    @Published var state: ViewState<[CharacterModel]> = .loading

    private let useCase: GetCharacterListUseCaseProtocol
    var characters: [CharacterModel] = []

    var currentPage: Int = 1
    @Published var isListFullLoaded = false
    var getCharacters: PassthroughSubject<Void, Never> = .init()

    private var cancellables = Set<AnyCancellable>()

    
    init(useCase: GetCharacterListUseCaseProtocol) {
        self.useCase = useCase
    }
    func load() {
        if characters.isEmpty {
            getCharacters.send()
        }
    }
   
    func subscribeToViewDidLoad() {
        getCharacters
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                Task {
                    await self.fetchCharacters(showLoading: true)
                }
            }
            .store(in: &cancellables)
    }
    func fetchCharacters(showLoading: Bool) async {
        if showLoading {
            await MainActor.run {
                state = .loading
            }
        }
        let input = GetCharacterUseCaseInput(page: currentPage)
        let result = await useCase.execute(input: input)
        await MainActor.run {
            map(charactersResponse: result)
        }
    }

    func map(charactersResponse: Result<CharactersListResponse, CharacterError>) {
        switch charactersResponse {
        case let .success(response):
            let chars = response.results
            guard !chars.isEmpty else {
                state = .empty
                return
            }

            currentPage = currentPage + 1

            self.characters.append(contentsOf: chars.map {
                CharacterModel(
                    name: $0.name ?? "",
                    species: $0.species?.rawValue ?? "",
                    location: $0.location?.name ?? "",
                    gender: $0.gender ?? .unknown,
                    status: $0.status ?? .unknown,
                    image: $0.image ?? ""
                )
            })
            state = .loaded(self.characters)
        case .failure:
            state = .failed(CharacterError.unknown)
        }
    }
}
