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
    public var species: String?
    public var type: String?
    public  var gender: String?
    public var origin, location: Location?
    public var image: String?
    public var episode: [String]?
    public var url: String?
    public var created: String?
    
    public init(
        id: Int? = nil,
        name: String? = nil,
        status: CharacterStatus? = nil,
        species: String? = nil,
        type: String? = nil,
        gender: String? = nil,
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

// MARK: - Location
public struct Location: Codable {
    public var name: String?
    public var url: String?
    public init(
        name: String? = nil,
        url: String? = nil
    ) {
        self.name = name
        self.url = url
    }
}


public enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
