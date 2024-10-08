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
typealias DidSelectCallBack = ((Int) -> Void)

class PopulateDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let cellReuseID = "CharacterItemView"
    private var characters: [CharacterModel]
    private var pagingCallback: DidReachEndCallback?
    private var selectionCallBack: DidSelectCallBack?

    init(
        tableView: UITableView,
        characters: [CharacterModel],
        pagingCallback: @escaping DidReachEndCallback,
        selectionCallBack: @escaping DidSelectCallBack
    ) {
        self.characters = characters
        self.pagingCallback = pagingCallback
        self.selectionCallBack = selectionCallBack
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
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellReuseID,
            for: indexPath
        ) as? BaseTableViewCell else {
            return UITableViewCell()
        }
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
        pagingCallback?(isReachingEnd)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectionCallBack?(indexPath.row)
    }
}
