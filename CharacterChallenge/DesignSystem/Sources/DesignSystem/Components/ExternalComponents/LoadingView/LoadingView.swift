//
//  File.swift
//  
//
//  Created by Ramy Nasser on 12/09/2024.
//

import Foundation
import SwiftUI

public struct LoadingView: View {
    @State private var shimmering = false
    private let streamSnow = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    private let streamGray = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    public init( ) { }
    
    public var body: some View {
        HStack {
            LinearGradient(gradient: Gradient(colors: [Color(streamSnow), Color(streamGray)]),
                           startPoint: .leading,
                           endPoint: shimmering ? .trailing : .leading)
            .mask(RoundedRectangle(cornerRadius: Fiber.shared.cornerRadius.small))
            .animation(.easeOut(duration: 2).repeatForever(autoreverses: false), value: shimmering)
            .padding(Fiber.shared.padding.medium)
            .frame(width: Fiber.shared.size.medium, height: Fiber.shared.size.medium)
            
            VStack(alignment: .leading) {
                LinearGradient(gradient: Gradient(colors: [Color(streamSnow), Color(streamGray)]),
                               startPoint: .leading,
                               endPoint: shimmering ? .trailing : .leading)
                .mask(RoundedRectangle(cornerRadius: Fiber.shared.cornerRadius.small))
                .animation(.easeOut(duration: 2).repeatForever(autoreverses: false), value: shimmering)
                .padding(Fiber.shared.padding.medium)
                .frame(height: 50)
                
                LinearGradient(gradient: Gradient(colors: [Color(streamSnow), Color(streamGray)]),
                               startPoint: .leading,
                               endPoint: shimmering ? .trailing : .leading)
                .mask(RoundedRectangle(cornerRadius: Fiber.shared.cornerRadius.small))
                .animation(.easeOut(duration: 2).repeatForever(autoreverses: false), value: shimmering)
                .padding(Fiber.shared.padding.medium)
                .frame(height: 50)
                
                Spacer()
            }
            .padding(.top, Fiber.shared.padding.medium)
            Spacer()
        }
        .onAppear {
            shimmering.toggle()
        }
        .frame(height: Fiber.shared.size.medium)
    }
}
