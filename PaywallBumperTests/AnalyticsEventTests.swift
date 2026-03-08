//
//  AnalyticsEventsTests.swift
//  PaywallBumperTests
//
//  Created by James Greiner on 3/8/26.
//

import XCTest
@testable import PaywallBumper

@MainActor
final class AnalyticsEventsTests: XCTestCase {
    func test_tapBasicFeature_doesNotTrackEvent() {
        let tracker = MockAnalyticsTracker()
        let vm = makeViewModel(variant: .featureLed, tracker: tracker)
        let feature = Feature.mockFeatures[0]

        vm.featureWasTapped(feature)

        XCTAssertEqual(tracker.events.count, 0)
        XCTAssertEqual(vm.selectedFeature, feature)
        XCTAssertNil(vm.paywallFeature)
    }

    func test_tapPremiumFeature_tracksEvent() {
        let tracker = MockAnalyticsTracker()
        let vm = makeViewModel(variant: .featureLed, tracker: tracker)
        let feature = Feature.mockFeatures[1]

        vm.featureWasTapped(feature)

        guard case .bumperShown(let variant, let name) = tracker.events.last else {
            return XCTFail("Expected bumperShown event")
        }

        XCTAssertEqual(variant, "A")
        XCTAssertEqual(name, feature.name)
        XCTAssertEqual(vm.paywallFeature, feature)
    }

    func test_tapUpgrade_tracksEvent() {
        let tracker = MockAnalyticsTracker()
        let vm = makeViewModel(variant: .valueLed, tracker: tracker)
        let feature = Feature.mockFeatures[4]

        vm.trackUpgradeTapped(feature)

        guard case .upgradeTapped(let variant) = tracker.events.first else {
            return XCTFail("Expected upgradeTapped event")
        }

        XCTAssertEqual(tracker.events.count, 1)
        XCTAssertEqual(variant, "B")
    }

    func test_tapDismiss_tracksEvent() {
        let tracker = MockAnalyticsTracker()
        let vm = makeViewModel(variant: .valueLed, tracker: tracker)
        let feature = Feature.mockFeatures[4]

        vm.trackBumperDismissed(feature)

        guard case .bumperDismissed(let variant) = tracker.events.first else {
            return XCTFail("Expected bumperDismissed event")
        }

        XCTAssertEqual(tracker.events.count, 1)
        XCTAssertEqual(variant, "B")
    }

    private func makeViewModel(variant: PaywallVariant, tracker: AnalyticsTracking) -> FeatureViewModel {
        FeatureViewModel(variantConfiguration: VariantConfiguration(paywallVariant: variant),
                         analyticsTracker: tracker)
    }
}
