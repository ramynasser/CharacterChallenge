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
    private let cellReuseID = "CharacterItemView"
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
        setupTableView()
        viewModelObservers()
    }
   
    private func setupTableView() {
        charactersTableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: cellReuseID)
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
    }
    private func setupViews() {
        filterCollectionTop.constant = fiberPadding.medium
        filterCollectionLeading.constant = fiberPadding.medium
        filterCollectionTrailing.constant = fiberPadding.medium

        tableViewTop.constant = fiberPadding.large
        tableViewBottom.constant = fiberPadding.medium
    }
    private func viewModelObservers() {
        viewModel.$state.sink { [weak self] state in
            switch state {
            case .loading:
                DispatchQueue.main.async {
                    self?.showActivityIndicator()
                }
            case .loaded:
                DispatchQueue.main.async {
                    self?.charactersTableView.reloadData()
                }
            default:
                print("other")

            }
        }
        .store(in: &cancellables)

    }
}
extension CharactersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = viewModel.characters[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as! CharacterTableViewCell
        cell.contentConfiguration = UIHostingConfiguration(content: {
            CharacterItemView(character: character)
        })
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

class CharacterTableViewCell: UITableViewCell {

    override func prepareForReuse() {
        super.prepareForReuse()
        // Clear the SwiftUI content to avoid incorrect data display during reuse
        self.contentConfiguration = nil
    }
}
