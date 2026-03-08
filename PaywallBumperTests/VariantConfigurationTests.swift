//
//  VariantConfigurationTests.swift
//  PaywallBumperTests
//
//  Created by James Greiner on 3/8/26.
//

import XCTest
@testable import PaywallBumper

@MainActor
final class VariantConfigurationTests: XCTestCase {
    func test_featureLedVariant_isConfigured() {
        let config = VariantConfiguration(paywallVariant: .featureLed)

        XCTAssertEqual(config.paywallVariant, .featureLed)
    }

    func test_valueLedVariant_isConfigured() {
        let config = VariantConfiguration(paywallVariant: .valueLed)

        XCTAssertEqual(config.paywallVariant, .valueLed)
    }

    func test_featureLedBumper_showsFeatureLedMessaging() {
        let vm = makeViewModel(variant: .featureLed)
        let feature = Feature.mockFeatures[1]

        let title = vm.bumperTitle(for: feature)
        let message = vm.bumperMessage(for: feature)

        XCTAssertEqual(title, "Unlock Offline Maps")
        XCTAssertEqual(message, "Upgrade to save and access maps without an internet connection.")
    }

    func test_valueLedBumper_showsValueLedMessaging() {
        let vm = makeViewModel(variant: .valueLed)
        let feature = Feature.mockFeatures[4]

        let title = vm.bumperTitle(for: feature)
        let message = vm.bumperMessage(for: feature)

        XCTAssertEqual(title, "Unlock the best map experience")
        XCTAssertEqual(message, "Upgrade to access premium features and make the most out of your adventure.")
    }

    private func makeViewModel(variant: PaywallVariant) -> FeatureViewModel {
        FeatureViewModel(variantConfiguration: VariantConfiguration(paywallVariant: variant),
                         analyticsTracker: MockAnalyticsTracker())
    }
}
