//
//  APIConfig.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation
import ConfigData

struct APIConfig: ApiConfigProtocol {
    static var baseURL: URL {
        let baseURLString = "https://rickandmortyapi.com/api"
        let baseURL = URL(string: baseURLString)
        return baseURL ?? URL(string: "")!
    }
}
