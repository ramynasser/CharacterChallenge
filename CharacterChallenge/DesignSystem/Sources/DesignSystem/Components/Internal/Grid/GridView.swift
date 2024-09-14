//
//  File.swift
//
//
//  Created by Ramy Nasser on 13/09/2024.
//

import Foundation
import SwiftUI
public struct GridView: View {
    public var items: [String]
    @Binding public var selectedItem: String?

    public init(items: [String], selectedItem: Binding<String?>) {
        self.items = items
        self._selectedItem = selectedItem
    }

    let columns = [
        GridItem(.flexible(), spacing: Fiber.shared.padding.xSmall)
    ]

    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: columns, spacing: Fiber.shared.padding.xSmall) {
                ForEach(items, id: \.self) { filter in
                    GridItemView(text: filter, isSelected: Binding(
                        get: { selectedItem == filter },
                        set: { isSelected in
                            selectedItem = isSelected ? filter : nil
                        }
                    ))
                }
            }
            .padding(.horizontal, Fiber.shared.padding.medium)
        }
        .frame(height: Fiber.shared.size.small)
    }
}
