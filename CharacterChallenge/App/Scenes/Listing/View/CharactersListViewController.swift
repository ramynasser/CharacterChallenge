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
    private let viewModel: CharactersListViewModel
    private var cancellables = Set<AnyCancellable>()
    
    @IBOutlet weak var filterCollectionTop: NSLayoutConstraint!
    @IBOutlet weak var filterCollectionLeading: NSLayoutConstraint!
    @IBOutlet weak var filterCollectionTrailing: NSLayoutConstraint!
    @IBOutlet weak var tableViewTop: NSLayoutConstraint!
    @IBOutlet weak var tableViewBottom: NSLayoutConstraint!
    @IBOutlet weak var charactersTableView: UITableView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    var loadingDataSource: LoadingDataSource?
    var populateDataSource: PopulateDataSource?
    
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
    
    private func setupViews() {
//        filterCollectionTop.constant = fiberPadding.medium
//        filterCollectionLeading.constant = fiberPadding.medium
//        filterCollectionTrailing.constant = fiberPadding.medium
        
        tableViewTop.constant = fiberPadding.large
        tableViewBottom.constant = fiberPadding.medium
        navigationItem.title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
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
                    characters: items, callback: { isPaging in
                        if isPaging {
                            self.viewModel.didFinishScroll()
                        }
                    })
            case .empty:
                print("empty")
            default:
                print("error")
                
            }
        }
        .store(in: &cancellables)
    }
}
