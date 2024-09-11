//
//  CharacterError.swift
//
//
//  Created by Ramy Nasser on 11/09/2024.
//

import CoreDomain
import CharacterDomain
import Networking

extension CharacterError: DecodableFromDTO {
    public struct DTO: Codable {
        public var message: String?

        enum CodingKeys: String, CodingKey {
            case message = "status_message"
        }
    }

    public init(from dto: DTO) {
        self = .error(message: dto.message ?? "")
    }
}
