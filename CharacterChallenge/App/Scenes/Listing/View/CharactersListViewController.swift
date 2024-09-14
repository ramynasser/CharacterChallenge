//
//  CharactersListViewController.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 11/09/2024.
//

import UIKit
import DesignSystem
import Combine
import SwiftUI
import Core

class CharactersListViewController: UIViewController {

    @IBOutlet weak var filterCollectionTop: NSLayoutConstraint!
    @IBOutlet weak var filterCollectionLeading: NSLayoutConstraint!
    @IBOutlet weak var filterCollectionTrailing: NSLayoutConstraint!
    @IBOutlet weak var tableViewTop: NSLayoutConstraint!
    @IBOutlet weak var tableViewBottom: NSLayoutConstraint!
    @IBOutlet weak var charactersTableView: UITableView!
    @IBOutlet weak var filterCollectionView: UICollectionView!

    private var loadingDataSource: LoadingDataSource?
    private var populateDataSource: PopulateDataSource?
    private var filterDataSource: FilterDataSource?
    private var coordinator: CharacterDetailCoordinator?
    private var emptyDataSource: EmptyDataSource?
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
        setupViews()
        viewModelObservers()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    private func setupViews() {
        setupNavigationBar()
    }
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Characters"
    }
    private func navigate(index: Int) {
        struct UseCase: CharacterDetailCoordinatorUseCaseProtocol {
            var characterId: Int
            var navigationController: UINavigationController?
        }

        coordinator = CharacterDetailCoordinator(
            useCase: UseCase(
                characterId: viewModel.characters[index].id,
                navigationController: self.navigationController
            )
        )
        coordinator?.start()
    }

    private func viewModelObservers() {
        viewModel.$state.sink { [weak self] state in
            guard let self = self else {
                return
            }
            switch state {
            case .loading:
                self.loadingDataSource = LoadingDataSource(tableView: self.charactersTableView)

            case let .loaded(items):
                self.populateDataSource = PopulateDataSource(
                    tableView: self.charactersTableView,
                    characters: items,
                    callback: { isPaging in
                        if isPaging {
                            self.viewModel.didFinishScroll()
                        }
                    },
                    selectionCallBack: { index in
                        self.navigate(index: index)
                    })
                self.filterDataSource = FilterDataSource(
                    collectionView: self.filterCollectionView,
                    filters: viewModel.filters,
                    selectedFilter: viewModel.selectedFilter,
                    callback: { filter in
                        self.viewModel.selectedFilter = filter
                    }
                )
            case .empty:
                emptyDataSource = EmptyDataSource(tableView: self.charactersTableView)
            default:
                emptyDataSource = EmptyDataSource(tableView: self.charactersTableView)
            }
        }
        .store(in: &cancellables)
    }
}
