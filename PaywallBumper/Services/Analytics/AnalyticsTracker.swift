//
//  AnalyticsTracker.swift
//  PaywallBumper
//
//  Created by James Greiner on 3/7/26.
//

import Foundation

final class AnalyticsTracker: AnalyticsTracking {
    func track(_ event: AnalyticsEvent) {
        print("✅ Event tracked: \(event)")
    }
}
