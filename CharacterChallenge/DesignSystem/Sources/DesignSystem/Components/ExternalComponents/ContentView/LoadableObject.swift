//
//  LoadableObject.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import SwiftUI
import Combine

protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: ViewState<Output> { get }
    func load()
}
