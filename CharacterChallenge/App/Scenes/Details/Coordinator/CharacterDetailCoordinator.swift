//
//  CharacterDetailCoordinator.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 14/09/2024.
//

import UIKit
import SwiftUI
protocol CharacterDetailCoordinatorUseCaseProtocol {
    var navigationController: UINavigationController? { get set }
    var characterId: Int { get set }
}
protocol CharacterDetailCoordinatorProtocol {
    init(useCase: CharacterDetailCoordinatorUseCaseProtocol)
    func start()

}
class CharacterDetailCoordinator: CharacterDetailCoordinatorProtocol {
    private let useCase: CharacterDetailCoordinatorUseCaseProtocol

    required init(useCase: CharacterDetailCoordinatorUseCaseProtocol) {
        self.useCase = useCase
    }

    func start() {
        let viewModel = CharacterDetailViewModel(
            useCase: Container.getCharacterDetailUseCase,
            characterId: useCase.characterId
        )
        let view = CharacterDetailView(viewModel: viewModel)

        let hostingController = UIHostingController(rootView: view)
        hostingController.navigationController?.isNavigationBarHidden = true
        useCase.navigationController?.pushViewController(hostingController, animated: true)
    }
}
