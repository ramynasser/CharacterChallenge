//
//  CharacterModel.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import CharacterDomain
struct CharacterModel {
    var id: Int
    var name: String
    var species: String
    var location: String
    var gender: String
    var status: CharacterStatus
    var image: String
}
extension CharacterModel {
    static var sample: CharacterModel {
        .init(
            id: 1,
            name: "Ramy",
            species: "Humanoid",
            location: "cairo",
            gender: "female", 
            status: .alive,
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
        )
    }
}
