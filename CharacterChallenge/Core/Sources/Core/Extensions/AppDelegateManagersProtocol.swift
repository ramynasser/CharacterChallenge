//
//  AppDelegateManagersProtocol.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation

public protocol Setupable {
    func setup()
}

public protocol Listenable {
    func listen()
}

public protocol AppDelegateManagable: Setupable, Listenable {
    static var shared: AppDelegateManagable { get }
}

public  extension AppDelegateManagable {
    func setup() {}
    func listen() {}
}
