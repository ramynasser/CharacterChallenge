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

/// ViewModel responsible for managing the state and business logic for a list of characters.
final class CharactersListViewModel: LoadableObject {
    /// The current state of the view, representing different loading or content states.
    @Published var state: ViewState<[CharacterModel]> = .idle

    /// A flag indicating whether the entire character list has been fully loaded.
    @Published var isListFullLoaded = false

    /// The currently selected filter based on character status.
    @Published var selectedFilter: CharacterStatus?

    /// An array of characters being displayed in the view.
    var characters: [CharacterModel] = []

    /// Available filters for character status.
    var filters: [CharacterStatus] = CharacterStatus.allCases

    /// The current page being loaded.
    var currentPage: Int = 1

    /// The total number of pages available.
    private var totalPages: Int = 0

    /// The use case responsible for fetching character data.
    private let useCase: GetCharacterListUseCaseProtocol

    /// A set of cancellables for managing subscriptions.
    private var cancellables = Set<AnyCancellable>()

    /// Initializes the ViewModel with a specified use case.
    ///
    /// - Parameter useCase: A use case conforming to `GetCharacterListUseCaseProtocol` used to fetch character data.
    init(useCase: GetCharacterListUseCaseProtocol) {
        self.useCase = useCase
        subscribeToFilter()
    }

    /// Initiates the loading of characters.
    func load() {
        Task {
            await self.fetchCharacters(showLoading: true)
        }
    }

    /// Subscribes to changes in the selected filter and applies it when changed.
    func subscribeToFilter() {
        $selectedFilter
            .dropFirst()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.applyFilter()
            }
            .store(in: &cancellables)
    }

    /// Applies the selected filter and reloads the characters.
    private func applyFilter() {
        characters = []
        currentPage = 1
        Task {
            await self.fetchCharacters(showLoading: true)
        }
    }

    /// Called when the user finishes scrolling, used to load more data if necessary.
    func didFinishScroll() {
        guard !isListFullLoaded else { return }

        if currentPage < totalPages {
            currentPage += 1
            Task {
                await self.fetchCharacters(showLoading: false)
            }
        }

        isListFullLoaded = currentPage == totalPages
    }

    /// Fetches the list of characters from the use case.
    ///
    /// - Parameter showLoading: A flag indicating whether to show a loading state during the request.
    func fetchCharacters(showLoading: Bool) async {
        if showLoading {
            await MainActor.run {
                state = .loading
            }
        }
        let input = GetCharacterUseCaseInput(
            page: currentPage,
            status: selectedFilter
        )
        let result = await useCase.execute(input: input)
        await MainActor.run {
            map(charactersResponse: result)
        }
    }

    /// Maps the response from the use case to the view's state.
    ///
    /// - Parameter charactersResponse: The result from fetching characters, containing either a success or failure.
    func map(charactersResponse: Result<CharactersListResponse, CharacterError>) {
        switch charactersResponse {
        case let .success(response):
            let chars = response.results
            guard !chars.isEmpty else {
                DispatchQueue.main.async {
                    self.state = .empty
                }
                return
            }

            self.characters.append(contentsOf: chars.map {
                CharacterModel(
                    id: $0.id ?? 0,
                    name: $0.name ?? "",
                    species: $0.species ?? "",
                    location: $0.location?.name ?? "",
                    gender: $0.gender ?? "",
                    status: $0.status ?? .unknown,
                    image: $0.image ?? ""
                )
            })
            self.totalPages = response.info?.pages ?? 0
            DispatchQueue.main.async {
                self.state = .loaded(self.characters)
            }
        case .failure:
            state = .failed(CharacterError.unknown)
        }
    }
}
