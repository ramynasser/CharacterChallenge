//
//  DismissibleNavigationView.swift
//
//  Created by Ramy Nasser on 14/09/2024.
//

import SwiftUI

public struct DismissibleNavigationView<Content: View>: View {
    // MARK: - Private properties
    
    private let content: Content
    private let dismissType: DismissType
    
    // MARK: init
    
    public init(dismissType: DismissType, content: () -> Content) {
        self.dismissType = dismissType
        self.content = content()
    }
    
    // MARK: - body
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            content
                .navigationBarBackButtonHidden()
            DismissToolBarButton(
                dismissAction: dismissType.dismissAction
            )
            .padding(.top, 60)
        }
        .ignoresSafeArea(edges: .top)
    }
}
