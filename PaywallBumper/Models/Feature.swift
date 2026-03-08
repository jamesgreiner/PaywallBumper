//
//  Feature.swift
//  PaywallBumper
//
//  Created by James Greiner on 3/6/26.
//

import Foundation

struct Feature: Hashable, Identifiable {
    let id: String
    let name: String
    let image: String
    let valueDescription: String
    let isPremium: Bool
}

extension Feature {
    static let mockFeatures: [Feature] = [
        Feature(id: "feature_explore",
                name: "Explore",
                image: "globe.americas.fill",
                valueDescription: "find your next adventure or discover new places",
                isPremium: false
        ),
        Feature(id: "feature_offline_maps",
                name: "Offline Maps",
                image: "map.cirlce.fill",
                valueDescription: "save and access maps without an internet connection",
                isPremium: true
        ),
        Feature(id: "feature_compass",
                name: "Compass",
                image: "location.north.circle.fill",
                valueDescription: "find your way wherever your journey takes you",
                isPremium: false
        ),
        Feature(id: "feature_land_boundaries",
                name: "Land Boundaries",
                image: "rectangle.portrait",
                valueDescription: "view public land boundaries and ownership information",
                isPremium: true
        ),
        Feature(id: "feature_weather",
                name: "Weather Forecast",
                image: "cloud.sun.circle.fill",
                valueDescription: "view the weather forecast for your location",
                isPremium: true
        )
    ]
}
