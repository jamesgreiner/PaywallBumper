//
//  FeatureView.swift
//  PaywallBumper
//
//  Created by James Greiner on 3/6/26.
//

import SwiftUI

struct FeatureView: View {
    let feature: Feature

    var body: some View {
        HStack {
            Text(feature.name)
                .foregroundStyle(.white)
                .font(.title)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.blue)
        .clipShape(.capsule)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
    }
}

#Preview {
    FeatureView(feature: Feature.mockFeatures[0])
}
