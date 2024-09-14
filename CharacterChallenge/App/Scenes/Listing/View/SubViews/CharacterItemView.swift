//
//  CharacterItemView.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 11/09/2024.
//

import Foundation
import SwiftUI
import DesignSystem
struct CharacterItemView: View {
    let character: CharacterModel

    var body: some View {
        HStack {
            RemoteImage(url: character.image)
                .cornerRadius(fiberCornerRadius.small)
                .padding(fiberPadding.medium)
                .frame(width: size.medium)

            VStack(alignment: .leading) {
                Text(character.name)
                    .font(fonts.utility.medium)
                    .foregroundColor(colors.primary)

                Text(character.species)
                    .font(fonts.headline.small)
                    .foregroundColor(colors.secondary)
                Spacer()
            }
            .padding(.top, fiberPadding.medium)
            Spacer()
        }
        .frame(height: size.medium)
        .background(
            character.status == .alive ?
            colors.primaryBlue :
            character.status == .dead ?
            colors.dangor : Color.clear
        )
        .cornerRadius(fiberCornerRadius.medium)
        .overlay(
            RoundedRectangle(cornerRadius: fiberCornerRadius.medium)
                .stroke(character.status == .unknown ? colors.primaryGray : Color.clear)
        )
    }
}
#Preview {
    CharacterItemView(character: .sample)
}
