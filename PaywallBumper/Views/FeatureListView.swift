//
//  FeatureListView.swift
//  PaywallBumper
//
//  Created by James Greiner on 3/6/26.
//

import SwiftUI

struct FeatureListView: View {
    @StateObject private var viewModel: FeatureViewModel

    init(viewModel: FeatureViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        featureList
            .navigationBarTitle("Available Features")
            .scrollContentBackground(.hidden)
            .navigationDestination(item: $viewModel.selectedFeature) { feature in
                FeatureDetailView(featureName: feature.name,
                                  imageName: feature.image)
            }
            .sheet(item: $viewModel.paywallFeature) { feature in
                PaywallBumperView(featureName: viewModel.bumperTitle(for: feature),
                                  valueDescription: viewModel.bumperMessage(for: feature),
                                  upgradeTapped: { viewModel.trackUpgradeTapped(feature) },
                                  dismissTapped: { viewModel.trackBumperDismissed(feature) }
                )
                .presentationDetents([.medium])
            }
    }

    private var featureList: some View {
        List(viewModel.availableFeatures) { feature in
            Button {
                viewModel.featureWasTapped(feature)
            } label: {
                FeatureView(feature: feature)
                    .padding()
            }
            .listRowSeparator(.hidden)
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    let config = VariantConfiguration(paywallVariant: .featureLed)
    let tracker = AnalyticsTracker()
    FeatureListView(viewModel: FeatureViewModel(variantConfiguration: config,
                                                analyticsTracker: tracker))
}
