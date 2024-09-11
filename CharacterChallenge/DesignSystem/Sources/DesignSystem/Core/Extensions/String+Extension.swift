//
//  String+Extension.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation

public extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
