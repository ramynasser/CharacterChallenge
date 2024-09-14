//
//  GetCharacterDetailUseCaseInput.swift
//
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
/// Input model for the `GetCharacterDetailUseCase`
///
/// This struct encapsulates the input data required to fetch details for
/// a specific character. In this case, the input is the unique identifier
/// (`id`) of the character.
public struct GetCharacterDetailUseCaseInput {

    /// The unique identifier of the character
    ///
    /// This `id` is used to specify which character's details should be fetched.
    public var id: Int

    /// Initializes the input model with a character's unique identifier
    ///
    /// - Parameter id: The unique identifier for the character whose details
    ///   need to be fetched.
    public init(id: Int) {
        self.id = id
    }
}
