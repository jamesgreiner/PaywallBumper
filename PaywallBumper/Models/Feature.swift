//
//  Feature.swift
//  PaywallBumper
//
//  Created by James Greiner on 3/5/26.
//

import Foundation

struct Feature: Hashable, Identifiable {
    let id: String
    let name: String
    let image: String
    let valueDescription: String
    let isPremium: Bool
}
