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
    @Published var state: ViewState<[CharacterModel]> = .idle

    private let useCase: GetCharacterListUseCaseProtocol
    var characters: [CharacterModel] = []
    var filters: [CharacterStatus] = []

    var currentPage: Int = 1
    var totalPages: Int = 0
    @Published var isListFullLoaded = false
    @Published var selectedFilter: CharacterStatus?

    var viewDidLoad: PassthroughSubject<Void, Never> = .init()

    private var cancellables = Set<AnyCancellable>()

    
    init(useCase: GetCharacterListUseCaseProtocol) {
        self.useCase = useCase
        subscribeToViewDidLoad()
    }
    func load() {
        viewDidLoad.send()
    }
    func subscribeToViewDidLoad() {
        viewDidLoad
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
    func didFinishScroll() {
        guard isListFullLoaded == false else {
            return
        }

        if currentPage < totalPages {
            currentPage += 1
            Task {
                await self.fetchCharacters(showLoading: false)
            }
        }

        isListFullLoaded = currentPage == totalPages
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

            self.characters.append(contentsOf: chars.map {
                CharacterModel(
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
