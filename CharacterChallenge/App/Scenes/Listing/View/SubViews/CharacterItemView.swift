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
                .frame(width: size.small, height: size.small)
                .cornerRadius(fiberCornerRadius.small)
                .shadow(radius: fiberCornerRadius.small)

            VStack(alignment: .leading) {
                Text(character.name)
                    .font(fonts.utility.medium)
                    .foregroundColor(colors.primary)
                
                Text(character.species)
                    .font(fonts.utility.small)
                    .foregroundColor(colors.secondary)
            }
            Spacer()
        }
        .padding()
        .cornerRadius(fiberCornerRadius.small)
    }
}
#Preview {
    CharacterItemView(character: .sample)
}
