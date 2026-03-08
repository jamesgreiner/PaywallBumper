//
//  FeatureViewModel.swift
//  PaywallBumper
//
//  Created by James Greiner on 3/6/26.
//

import Combine
import Foundation

@MainActor
final class FeatureViewModel: ObservableObject {
    @Published var selectedFeature: Feature?
    @Published var paywallFeature: Feature?

    private let variantConfiguration: VariantConfiguration
    private let analyticsTracker: AnalyticsTracking

    let features: [Feature]
    var availableFeatures: [Feature] {
        features
    }

    init(features: [Feature]? = nil,
         variantConfiguration: VariantConfiguration,
         analyticsTracker: AnalyticsTracking
    ) {
        self.features = features ?? Feature.mockFeatures
        self.variantConfiguration = variantConfiguration
        self.analyticsTracker = analyticsTracker
    }

    func featureWasTapped(_ feature: Feature) {
        if feature.isPremium {
            paywallFeature = feature
            trackBumperShown(feature)
        } else {
            selectedFeature = feature
        }
    }

    func trackBumperShown(_ feature: Feature) {
        analyticsTracker.track(.bumperShown(variant: variantConfiguration.paywallVariant.rawValue,
                                            featureName: feature.name))
    }

    func trackUpgradeTapped(_ feature: Feature) {
        analyticsTracker.track(.upgradeTapped(variant: variantConfiguration.paywallVariant.rawValue))
    }

    func trackBumperDismissed(_ feature: Feature) {
        analyticsTracker.track(.bumperDismissed(variant: variantConfiguration.paywallVariant.rawValue))
    }

    func bumperTitle(for feature: Feature) -> String {
        switch variantConfiguration.paywallVariant {
        case .featureLed:
            return "Unlock \(feature.name)"
        case .valueLed:
            return "Unlock the best map experience"
        }
    }

    func bumperMessage(for feature: Feature) -> String {
        switch variantConfiguration.paywallVariant {
        case .featureLed:
            return "Upgrade to \(feature.valueDescription)."
        case .valueLed:
            return "Upgrade to access premium features and make the most out of your adventure."
        }
    }
}
