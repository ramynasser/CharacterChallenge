//
//  EmptyView.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import SwiftUI

public struct EmptyStateView: View {
    public var icon: Image?
    public var title: String?
    public var titleColor: Color = Fiber.shared.colors.white
    public var subTitle: String?
    public var subTitleColor: Color = Fiber.shared.colors.secondaryGray

    public init(
        icon: Image? = nil,
        title: String? = nil,
        titleColor: Color = Fiber.shared.colors.white,
        subTitle: String? = nil,
        subTitleColor: Color = Fiber.shared.colors.secondaryGray
    ) {
        self.icon = icon
        self.title = title
        self.titleColor = titleColor
        self.subTitle = subTitle
        self.subTitleColor = subTitleColor
    }

    public var body: some View {
        VStack(alignment: .center) {
            if let icon = icon {
                icon
                    .resizable()
                    .frame(width: Fiber.shared.size.medium, height: Fiber.shared.size.medium)
            }
            if let title = title, !title.isEmpty {
                Text(title)
                    .font(Fiber.shared.fonts.body.large)
                    .foregroundStyle(titleColor)
                    .padding(.top, Fiber.shared.padding.small)
                    .multilineTextAlignment(.center)
            }
            if let subTitle = subTitle, !subTitle.isEmpty {
                Text(subTitle)
                    .foregroundStyle(subTitleColor)
                    .padding(.top, Fiber.shared.padding.xSmall)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(50)
    }
}

#Preview {
    EmptyStateView(icon: Image(systemName: "plus"),
              title: "we are sorry, we can not find any charachers ",
              subTitle: "Find your characheter")
    .background(Fiber.shared.colors.black)
}
