//
//  LoadingState.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import SwiftUI
import Combine
enum ViewState<Value>: Equatable {
    static func == (lhs: ViewState<Value>, rhs: ViewState<Value>) -> Bool {
        return String(describing: lhs.self) == String(describing: rhs.self)
    }

    case idle
    case loading
    case failed(Error)
    case loaded(Value)
    case empty
}
