//
//  LoadingDataSource.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 12/09/2024.
//

import UIKit
import SwiftUI
import Core
import DesignSystem

class LoadingDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let cellReuseID = "loadingItemView"

    init(
        tableView: UITableView
    ) {
        super.init()
        tableView.register(
            BaseTableViewCell.self, forCellReuseIdentifier: cellReuseID
        )
        tableView.dataSource = self
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellReuseID,
            for: indexPath
        ) as? BaseTableViewCell else {
            return UITableViewCell()
        }
        cell.contentConfiguration = UIHostingConfiguration(content: {
            LoadingView()
        })
        cell.selectionStyle = .none
        return cell
    }
}
