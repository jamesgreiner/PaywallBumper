//
//  PaywallBumperApp.swift
//  PaywallBumper
//
//  Created by James Greiner on 3/5/26.
//

import SwiftUI

@main
struct PaywallBumperApp: App {
    // Swap 'paywallVariant' to change bumper type
    private let variantConfig = VariantConfiguration(paywallVariant: .featureLed)
    private let analyticsTracker = AnalyticsTracker()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                FeatureListView(viewModel: FeatureViewModel(variantConfiguration: variantConfig,
                                                            analyticsTracker: analyticsTracker))
            }
        }
    }
}
