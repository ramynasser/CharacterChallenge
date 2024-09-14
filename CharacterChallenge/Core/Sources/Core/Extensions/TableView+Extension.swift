//
//  File.swift
//  
//
//  Created by Ramy Nasser on 12/09/2024.
//

import Foundation
import UIKit
public extension UIScrollView {
    var didReachEnd: Bool {
        let isReachingEnd = contentOffset.y >= 0
              && contentOffset.y >= (contentSize.height - frame.size.height)
        return isReachingEnd
    }
}

public extension UITableView {
    func isLastCell(at indexPath: IndexPath) -> Bool {
        let lastSectionIndex = numberOfSections - 1
        let lastRowIndex = numberOfRows(inSection: lastSectionIndex) - 1
        return indexPath.section == lastSectionIndex && indexPath.row == lastRowIndex
    }

    func showLoadingFooterIfLastCell(at indexPath: IndexPath) {
        if isLastCell(at: indexPath) {
            self.showLoadingFooter()
        }
    }
    func showLoadingFooter() {
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.bounds.width, height: CGFloat(44))

        self.tableFooterView = spinner
        self.tableFooterView?.isHidden = false
    }
}
