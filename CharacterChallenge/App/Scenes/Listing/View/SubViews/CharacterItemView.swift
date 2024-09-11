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
                    .font(fonts.utility.small)
                    .foregroundColor(colors.secondary)
                Spacer()
            }
            .padding(.top, fiberPadding.medium)
            Spacer()
        }
        .frame(height: size.medium)
        .background(content: {
            if character.status == .alive {
                colors.primaryBlue
                .cornerRadius(fiberCornerRadius.small)
            } else if character.status == .dead {
                colors.dangor
                .cornerRadius(fiberCornerRadius.small)
            } else {
                RoundedRectangle(cornerRadius: fiberCornerRadius.small)
                    .stroke(colors.primaryGray, lineWidth: fiberBorders.small)
            }
        })

    }
}
#Preview {
    CharacterItemView(character: .sample)
}
