//
//  CharacterDetailView.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 14/09/2024.
//

import SwiftUI
import DesignSystem
struct CharacterDetailView: View {

    var viewModel: CharacterDetailViewModel

    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        DismissibleNavigationView(dismissType: .back) {
            ContentView(source: viewModel) { model in
                getCotentView(model: model)
            } failureContent: {
                EmptyStateView
                    .Builder()
                    .setIcon(Image("ic_error"))
                    .setTitle("Error")
                    .setSubTitle("Something went wrong, Try again!")
                    .build()
            } emptyContent: {
                EmptyStateView
                    .Builder()
                    .setIcon(Image("ic_empty"))
                    .setTitle("No Data")
                    .setSubTitle("No Data To Show")
                    .build()
            }
            .background(colors.white)
        }
    }

}
extension CharacterDetailView {
    @ViewBuilder
    func getCotentView(model: CharacterModel) -> some View {
        VStack(alignment: .leading, spacing: fiberPadding.large) {
            RemoteImage(url: model.image)
                .frame(height: size.xLarge)
                .clipShape(RoundedRectangle(cornerRadius: fiberCornerRadius.large))
                .ignoresSafeArea(edges: .top)

            // Profile Info
            VStack(alignment: .leading, spacing: fiberPadding.xSmall) {
                // Name and Status
                HStack {
                    Text(model.name)
                        .font(fonts.headline.large)
                        .foregroundStyle(colors.primary)

                    Spacer()

                    Text(model.status.rawValue)
                        .font(fonts.body.small)
                        .foregroundStyle(colors.primary)
                        .padding(fiberPadding.small)
                        .background(colors.secondaryBlue)
                        .cornerRadius(fiberCornerRadius.large)
                }

                // Species and Gender
                HStack {
                    Text(model.species)
                        .font(fonts.body.medium)
                        .foregroundStyle(colors.secondary)

                    Text("•")
                        .foregroundStyle(colors.secondary)

                    Text(model.gender)
                        .font(fonts.body.medium)
                        .foregroundStyle(colors.secondaryGray)
                }

            }
            .padding(.horizontal, fiberPadding.medium)

            // Location
            HStack {
                Text("Location :")
                    .font(fonts.utility.large)
                    .foregroundStyle(colors.primary)

                Text(model.location)
                    .font(fonts.utility.small)
                    .foregroundStyle(colors.secondary)
            }
            .padding(.horizontal, fiberPadding.medium)

            Spacer() // Push content to the top
        }
        .padding(.top, fiberPadding.medium)
    }
}
