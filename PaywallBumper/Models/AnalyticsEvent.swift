//
//  AnalyticsEvent.swift
//  PaywallBumper
//
//  Created by James Greiner on 3/7/26.
//

import Foundation

enum AnalyticsEvent {
    case bumperShown(variant: String, featureName: String)
    case upgradeTapped(variant: String)
    case bumperDismissed(variant: String)
    
}
