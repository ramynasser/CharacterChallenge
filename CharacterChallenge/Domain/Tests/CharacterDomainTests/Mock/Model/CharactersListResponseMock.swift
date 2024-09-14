//
//  CharactersListResponseMock.swift
//
//
//  Created by Ramy Nasser on 15/09/2024.
//

@testable import CoreDomain
import Foundation
@testable import CharacterDomain

var pageInfo = Info(count: 100, pages: 10, next: "", prev: "")
var charactersListSuccessResponseMock = CharactersListResponse(
    info: pageInfo,
    results: [
        CharacterDetails(
            id: 1,
            name: "name1",
            status: .alive,
            species: "species1",
            type: "type1",
            gender: "male",
            origin: nil,
            location: nil,
            image: "image1.png",
            episode: [],
            url: "",
            created: ""
        ),
        CharacterDetails(
            id: 2,
            name: "name2",
            status: .dead,
            species: "species2",
            type: "type2",
            gender: "female",
            origin: nil,
            location: nil,
            image: "image2.png",
            episode: [],
            url: "",
            created: ""
        ),
        CharacterDetails(
            id: 3,
            name: "name3",
            status: .dead,
            species: "species3",
            type: "type3",
            gender: "female",
            origin: nil,
            location: nil,
            image: "image3.png",
            episode: [],
            url: "",
            created: ""
        )
    ]
)
var charactersDetailSuccessResponseMock =  CharacterDetails(
    id: 1,
    name: "name1",
    status: .alive,
    species: "species1",
    type: "type1",
    gender: "male",
    origin: nil,
    location: nil,
    image: "image1.png",
    episode: [],
    url: "",
    created: ""
)
