//
//  PopulateDataSource.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 12/09/2024.
//

import UIKit
import SwiftUI
import Core
import DesignSystem
typealias DidReachEndCallback = ((Bool) -> Void)

class PopulateDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let cellReuseID = "CharacterItemView"
    private var characters: [CharacterModel]
    private var callback: DidReachEndCallback?
    
    init(
        tableView: UITableView,
        characters: [CharacterModel],
        callback: @escaping DidReachEndCallback
    ) {
        self.characters = characters
        self.callback = callback
        super.init()
        tableView.register(
            BaseTableViewCell.self, forCellReuseIdentifier: cellReuseID
        )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = characters[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as! BaseTableViewCell
        cell.contentConfiguration = UIHostingConfiguration(content: {
            CharacterItemView(character: character)
        })
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.showLoadingFooterIfLastCell(at: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return size.large
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let isReachingEnd = scrollView.didReachEnd
        callback?(isReachingEnd)
    }
}

