//
//  SpinnerView.swift
//
//
//  Created by Ramy Nasser on 10/09/2024.
//

import SwiftUI
import UIKit

public struct SpinnerView: View {
    @State private var degree: Int = 270
    @State private var spinnerLength = 0.6
    public var width: CGFloat = 40
    public var height: CGFloat = 40

    public init(degree: Int = 270,
                spinnerLength: Double = 0.6,
                width: CGFloat = 40,
                height: CGFloat = 40) {
        self.degree = degree
        self.spinnerLength = spinnerLength
    }

    public var body: some View {
        Circle()
            .trim(from: 0.0, to: spinnerLength)
            .stroke(
                Fiber.shared.colors.primary,
                style: StrokeStyle(
                    lineWidth: 5,
                    lineCap: .square,
                    lineJoin: .round
                )
            )
            .animation(
                Animation.easeIn(duration: 1.5)
                    .repeatForever(autoreverses: true),
                value: degree
            )
            .frame(width: width, height: height)
            .rotationEffect(Angle(degrees: Double(degree)))
            .animation(
                Animation.linear(duration: 1)
                    .repeatForever(autoreverses: false),
                value: degree
            )
            .onAppear {
                DispatchQueue.main.async {
                    degree = 270 + 360
                    spinnerLength = 0
                }
            }
    }
}

#Preview {
    SpinnerView()
}


public extension UIViewController {
    private struct ActivityIndicatorTag {
        static let tag = 9999
    }

    func showActivityIndicator() {
        DispatchQueue.main.async {
            // Remove any existing activity indicator
            self.hideActivityIndicator()

            // Create a UIHostingController with your SpinnerView
            let spinnerView = SpinnerView()
            let hostingController = UIHostingController(rootView: spinnerView)
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            hostingController.view.tag = ActivityIndicatorTag.tag

            // Add the hosting controller's view as a subview
            self.view.addSubview(hostingController.view)

            // Center the spinner view in the parent view
            NSLayoutConstraint.activate([
                hostingController.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                hostingController.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                hostingController.view.widthAnchor.constraint(equalToConstant: 40),
                hostingController.view.heightAnchor.constraint(equalToConstant: 40)
            ])

            // Add the hosting controller as a child view controller
            self.addChild(hostingController)
            hostingController.didMove(toParent: self)
        }
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async {
            if let existingSpinnerView = self.view.viewWithTag(ActivityIndicatorTag.tag) {
                existingSpinnerView.removeFromSuperview()
            }
        }
    }
}
