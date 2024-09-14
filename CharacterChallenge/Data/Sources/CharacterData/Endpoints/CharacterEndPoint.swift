//
//  CharacterEndPoint.swift
//
//
//  Created by Ramy Nasser on 11/09/2024.
//

import ConfigData
import Foundation
import CharacterDomain
import Networking

enum CharacterEndpoint {
    case listing(page: Int, status: CharacterStatus?)
    case details(id: Int)
}

extension CharacterEndpoint: RemoteEndpoint {
    var baseUrl: URL {
        apiConfig.baseURL
    }
    
    var apiVersion: String? {
        return apiConfig.apiVersion
    }
    
    var path: String {
        switch self {
        case .listing:
            return "character"
        case let .details(id):
            return "character/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var requestTask: RequestParameterTask {
        var param = NetworkHTTPParameters()
        switch self {
        case let .listing(page, status):
            param["page"] = page
            if let status = status {
                param["status"] = status
            }
        default:
            break
        }
        return RequestParameterTask.requestParameters(parameters: param,
                                                      encoding: .query)
    }
}
