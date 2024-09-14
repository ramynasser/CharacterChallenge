//
//  XCTest+PublishObject.swift
//  CharacterChallengeTests
//
//  Created by Ramy Nasser on 15/09/2024.
//

import XCTest
import Combine
import CharacterDomain
extension XCTest {
    func waitForPublished<T: Equatable>(
        _ publisher: Published<T>.Publisher,
        equals expectedValue: T,
        within seconds: TimeInterval
    ) async {
        var cancellable: AnyCancellable?
        await withCheckedContinuation { continuation in
            cancellable = publisher
                .first(where: { $0 == expectedValue })
                .sink(receiveValue: { _ in
                    continuation.resume()
                })
        }
        cancellable?.cancel()
    }
}
