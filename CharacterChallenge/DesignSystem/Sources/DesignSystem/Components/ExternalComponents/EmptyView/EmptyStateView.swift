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

    // Private initializer
    private init(
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

    // Builder class to incrementally set properties
    public class Builder {
        private var icon: Image?
        private var title: String?
        private var titleColor: Color = Fiber.shared.colors.white
        private var subTitle: String?
        private var subTitleColor: Color = Fiber.shared.colors.secondaryGray

        public init() {}

        public func setIcon(_ icon: Image?) -> Builder {
            self.icon = icon
            return self
        }

        public func setTitle(_ title: String?) -> Builder {
            self.title = title
            return self
        }

        public func setTitleColor(_ color: Color) -> Builder {
            self.titleColor = color
            return self
        }

        public func setSubTitle(_ subTitle: String?) -> Builder {
            self.subTitle = subTitle
            return self
        }

        public func setSubTitleColor(_ color: Color) -> Builder {
            self.subTitleColor = color
            return self
        }

        public func build() -> EmptyStateView {
            return EmptyStateView(
                icon: icon,
                title: title,
                titleColor: titleColor,
                subTitle: subTitle,
                subTitleColor: subTitleColor
            )
        }
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
    EmptyStateView.Builder()
        .setIcon(Image(systemName: "plus"))
        .setTitle("We are sorry, we cannot find any characters")
        .setSubTitle("Find your character")
        .build()
        .background(Fiber.shared.colors.black)
}
