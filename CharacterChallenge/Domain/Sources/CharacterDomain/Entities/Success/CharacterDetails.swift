//
//  CharacterDetails.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import Foundation
public struct CharacterDetails: Codable {
    public var id: Int?
    public var name: String?
    public var status: CharacterStatus?
    public var species: Species?
    public var type: String?
    public  var gender: Gender?
    public var origin, location: Location?
    public var image: String?
    public var episode: [String]?
    public var url: String?
    public var created: String?
    
    public init(
        id: Int? = nil,
        name: String? = nil,
        status: CharacterStatus? = nil,
        species: Species? = nil,
        type: String? = nil,
        gender: Gender? = nil,
        origin: Location? = nil,
        location: Location? = nil,
        image: String? = nil,
        episode: [String]? = nil,
        url: String? = nil,
        created: String? = nil
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}

public enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
public struct Location: Codable {
    var name: String?
    var url: String?
    public init(
        name: String? = nil,
        url: String? = nil
    ) {
        self.name = name
        self.url = url
    }
}

public enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

public enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
