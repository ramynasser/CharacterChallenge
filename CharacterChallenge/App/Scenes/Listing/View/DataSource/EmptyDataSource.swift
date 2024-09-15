//
//  EmptyDataSource.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 14/09/2024.
//

import UIKit
import SwiftUI
import Core
import DesignSystem
class EmptyDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let cellReuseID = "EmptyItemView"

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
        return size.medium
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellReuseID,
            for: indexPath
        ) as? BaseTableViewCell else {
            return UITableViewCell()
        }
        cell.contentConfiguration = UIHostingConfiguration(content: {
            EmptyStateView
                .Builder()
                .setIcon(Image("ic_empty"))
                .setTitle("No Data Available")
                .setSubTitle(
                    "It looks like we couldn't find any characters. Please try refreshing the view"
                )
                .build()
        })
        cell.selectionStyle = .none
        return cell
    }
}
