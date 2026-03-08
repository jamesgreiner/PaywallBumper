//
//  MockAnalyticsTracker.swift
//  PaywallBumperTests
//
//  Created by James Greiner on 3/8/26.
//

import Foundation
@testable import PaywallBumper

final class MockAnalyticsTracker: AnalyticsTracking {
    private(set) var events: [AnalyticsEvent] = []

    func track(_ event: AnalyticsEvent) {
        events.append(event)
    }
}

