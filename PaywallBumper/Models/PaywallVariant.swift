//
//  PaywallVariant.swift
//  PaywallBumper
//
//  Created by James Greiner on 3/7/26.
//

import Foundation

enum PaywallVariant: String {
    case featureLed = "A"
    case valueLed = "B"
}

struct VariantConfiguration {
    let paywallVariant: PaywallVariant
}
