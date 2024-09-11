//
//  CharactersListViewController.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 11/09/2024.
//

import UIKit
import DesignSystem
import Combine

class CharactersListViewController: UIViewController {
    private let viewModel: CharactersListViewModel
    private var cancellables = Set<AnyCancellable>()

    //MARK: - Init
    init(viewModel: CharactersListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModelObservers()
    }
    private func viewModelObservers() {
        viewModel.$state.sink { [weak self] state in
            switch state {
            case .loading:
                print("loading")
            case .loaded:
                print("loaded")
            default:
                print("other")

            }
        }
        .store(in: &cancellables)

    }
}
