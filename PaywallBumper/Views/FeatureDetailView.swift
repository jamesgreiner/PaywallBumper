//
//  FeatureDetailView.swift
//  PaywallBumper
//
//  Created by James Greiner on 3/6/26.
//

import SwiftUI

struct FeatureDetailView: View {

    let featureName: String
    let imageName: String

    var body: some View {
        VStack {
            Text(featureName)
                .font(.largeTitle)
                .padding()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
        }
    }
}

#Preview {
    let feature = Feature.mockFeatures[0]
    FeatureDetailView(featureName: feature.name, imageName: feature.image)
}
