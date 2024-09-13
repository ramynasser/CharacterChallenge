//
//  FilterItemView.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 12/09/2024.
//
import SwiftUI
//struct GridView: View {
//    var items: [String]
//    @Binding var selectedItem: String?
//    
//    let columns = [
//        GridItem(.flexible(), spacing: 5) // Adjust spacing as needed
//    ]
//    
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            LazyHGrid(rows: columns, spacing: 5) {
//                ForEach(items, id: \.self) { filter in
//                    GridItemView(text: filter, isSelected: Binding(
//                        get: { selectedItem == filter },
//                        set: { isSelected in
//                            selectedItem = isSelected ? filter : nil
//                        }
//                    ))
//                }
//            }
//            .padding(.horizontal, 16) // Adjust padding as necessary
//        }
//        .frame(height: 60) // Adjust height based on your design
//    }
//}
//struct GridItemView: View {
//    var text: String
//    @Binding var isSelected: Bool
//
//    var body: some View {
//        Text(text)
//            .foregroundStyle(colors.primary)
//            .font(fonts.headline.small)
//            .padding(fiberPadding.small)
//            .background(isSelected ? colors.secondaryGray : Color.clear)
//            .cornerRadius(fiberCornerRadius.large)
//            .overlay(
//                RoundedRectangle(cornerRadius: fiberCornerRadius.large)
//                    .stroke(isSelected ? .clear : colors.secondaryGray, lineWidth: fiberBorders.small)
//            )
//            .onTapGesture {
//                isSelected.toggle()
//            }
//    }
//}
