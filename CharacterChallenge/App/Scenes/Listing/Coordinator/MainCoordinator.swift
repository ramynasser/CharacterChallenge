//
//  MainCoordinator.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import UIKit
protocol MainCoordinatorUseCaseProtocol {
    var window: UIWindow? { get set }
}
protocol MainCoordinatorProtocol {
    init(useCase: MainCoordinatorUseCaseProtocol)
    func start()

}
class MainCoordinator: MainCoordinatorProtocol {
    let useCase: MainCoordinatorUseCaseProtocol
    private let window: UIWindow?
    private var navigationController: UINavigationController?

    required init(useCase: MainCoordinatorUseCaseProtocol) {
        self.useCase = useCase
        window = useCase.window
    }
    
    func start() {
        let viewModel = CharactersListViewModel(useCase: Container.getCharacterListUseCase)
        let initialViewController = CharactersListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: initialViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
