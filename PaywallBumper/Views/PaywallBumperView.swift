//
//  PaywallBumperView.swift
//  PaywallBumper
//
//  Created by James Greiner on 3/6/26.
//

import SwiftUI

struct PaywallBumperView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var wasDismissedByTap = false

    let featureName: String
    let valueDescription: String
    let upgradeTapped: () -> Void
    let dismissTapped: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            dismissButton
            paywallContent
            Spacer()
            upgradeButton
        }
        .onDisappear {
            if !wasDismissedByTap {
                dismissTapped()
            }
        }
    }

    private var dismissButton: some View {
        HStack {
            Spacer()

            Button {
                wasDismissedByTap = true
                dismissTapped()
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .padding()
                    .font(.title2)
                    .tint(.black)
                    .bold()
                    .background(.blue)
                    .clipShape(.buttonBorder)
            }
            .padding(.top)
            .padding(.trailing)
        }
    }

    @ViewBuilder
    private var paywallContent: some View {
        HStack {
            Text(featureName)
                .font(.largeTitle)
                .bold()
            Spacer()
        }
        .padding()

        HStack {
            Text(valueDescription)
                .font(.title3)
                .bold()
            Spacer()
        }
        .padding()
    }

    private var upgradeButton: some View {
        Button("Upgrade Your Adventure") {
            upgradeTapped()
        }
        .padding()
        .font(.title2)
        .tint(.white)
        .bold()
        .background(.blue)
        .clipShape(.buttonBorder)
    }
}

#Preview {
    let feature = Feature.mockFeatures[4]
    PaywallBumperView(featureName: feature.name,
                      valueDescription: feature.valueDescription,
                      upgradeTapped: {},
                      dismissTapped: {})
}
