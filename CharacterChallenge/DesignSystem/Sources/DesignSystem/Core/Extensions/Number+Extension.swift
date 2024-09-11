//
//  Double+Extension.swift
//
//
// Created by Ramy Nasser on 10/09/2024.
//

import Foundation

public extension Double {
    func string(maximumFractionDigits: Int = 1) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = maximumFractionDigits
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

public extension Float {
    func string(maximumFractionDigits: Int = 1) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = maximumFractionDigits
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

public extension Int {
    func string(maximumFractionDigits: Int = 1) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = maximumFractionDigits
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
