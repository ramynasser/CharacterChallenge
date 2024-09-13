//
//  RemoteImage.swift
//
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import SwiftUI
public struct RemoteImage: View {
    public let url: String
    public var placeholder: Image = Image(systemName: "exclamationmark.triangle")

    public init(
        url: String,
        placeholder: Image = Image(
                    systemName: "exclamationmark.triangle"
        )
    ) {
        self.url = url
        self.placeholder = placeholder
    }

    public var body: some View {
        AsyncCachedImage(url: URL(string: url)) { image in
            image
            .resizable()
            .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }
    }
}
#Preview {
    RemoteImage(url: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg")
}
