//
//  DismissToolBarButton.swift
//
//
//  Created by Ramy Nasser on 14/09/2024.
//

import Foundation
import SwiftUI
public struct DismissToolBarButton: View {
    private let dismissAction: (() -> Void)?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    // MARK: init

    public init(dismissAction: (() -> Void)? = nil) {
        self.dismissAction = dismissAction
    }

    public var body: some View {
        Button {
            if let action = dismissAction {
                action()
            } else {
                presentationMode.wrappedValue.dismiss()
            }
        } label: {
            Image(systemName: "arrow.left")
                .foregroundColor(Fiber.shared.colors.primary)
                .padding(Fiber.shared.padding.medium)
                .background(Fiber.shared.colors.white)
                .clipShape(Circle())
                .shadow(radius: Fiber.shared.cornerRadius.small)
        }
        .buttonStyle(.plain)
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        DismissToolBarButton()
    }
}
