//
//  GridItemView.swift
//
//  Created by Ramy Nasser on 13/09/2024.
//

import Foundation
import SwiftUI
public struct GridItemView: View {
    public var text: String
    @Binding public var isSelected: Bool
    
    public var body: some View {
        Text(text)
            .foregroundStyle(Fiber.shared.colors.primary)
            .font(Fiber.shared.fonts.headline.small)
            .padding(Fiber.shared.padding.small)
            .background(isSelected ? Fiber.shared.colors.secondaryGray : Color.clear)
            .cornerRadius(Fiber.shared.cornerRadius.large)
            .overlay(
                RoundedRectangle(cornerRadius: Fiber.shared.cornerRadius.large)
                    .stroke(
                        isSelected ? .clear : Fiber.shared.colors.secondaryGray,
                        lineWidth: Fiber.shared.borders.small
                    )
            )
            .onTapGesture {
                isSelected.toggle()
            }
    }
}
