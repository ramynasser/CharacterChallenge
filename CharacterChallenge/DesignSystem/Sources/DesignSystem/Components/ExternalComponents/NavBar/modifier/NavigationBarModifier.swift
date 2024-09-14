//
//  NavigationBarModifier.swift
//
//
//  Created by Ramy Nasser on 14/09/2024.
//

import SwiftUI
import UIKit
public struct NavigationBarModifier: ViewModifier {
    var backgroundColor: Color?
    var titleColor: Color?

    public init(backgroundColor: Color?, titleColor: Color?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = UIColor(backgroundColor ?? .white)
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor(titleColor ?? .white)]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(titleColor ?? .white)]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    public func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                GeometryReader { geometry in
                    self.backgroundColor
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

public extension View {
    func navigationBarColor(backgroundColor: Color?, titleColor: Color?) -> some View {
        modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}
