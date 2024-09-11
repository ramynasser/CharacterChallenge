//
//  CharacterListingResponse+DTO.swift
//
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import CoreDomain
import CharacterDomain
extension Info: DecodableFromDTO {
    public struct DTO: Codable {
        var count, pages: Int?
        var next: String?
        var prev: String?
    }
    public init(from dto: DTO) {
        self = Info(
            count: dto.count,
            pages: dto.pages,
            next: dto.next,
            prev: dto.prev
        )
    }
}
extension CharactersListResponse: DecodableFromDTO {
    public struct DTO: Codable {
        let info: Info.DTO
        let results: [CharacterDetails.DTO]

        enum CodingKeys: String, CodingKey {
            case info, results
        }
    }
    public init(from dto: DTO) {
        let items = dto.results.map {
            CharacterDetails(from: $0)
        }
        
        let info = Info(from: dto.info)

        self = CharactersListResponse(
            info: info,
            results: items
        )
    }
}
