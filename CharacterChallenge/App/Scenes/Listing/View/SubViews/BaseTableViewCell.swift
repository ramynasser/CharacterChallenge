//
//  CharacterTableViewCell.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 12/09/2024.
//

import UIKit
class BaseTableViewCell: UITableViewCell {

    override func prepareForReuse() {
        super.prepareForReuse()
        // Clear the SwiftUI content to avoid incorrect data display during reuse
        self.contentConfiguration = nil
    }
}
