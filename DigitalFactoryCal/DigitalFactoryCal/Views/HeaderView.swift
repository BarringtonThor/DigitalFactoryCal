//
//  HeaderView.swift
//  DigitalFactoryCal
//
//  Created by Barrington Thorpe on 4/4/25.
//

import SwiftUI

/// Header view that displays the app title and logo
struct HeaderView: View {
    // MARK: - Body

    var body: some View {
        HStack {
            // App title with custom color
            titleText

            // Building icon with animation
            buildingIcon

            Spacer()
        }
    }

    // MARK: - Components

    /// App title text with custom styling
    private var titleText: some View {
        Text("Digital Factory")
            .foregroundColor(digitalFactoryColor)
            .font(.headline)
    }

    /// Animated building icon
    private var buildingIcon: some View {
        Image(systemName: "building.2.fill")
            .foregroundColor(digitalFactoryColor)
            .symbolEffect(
                .bounce.up.byLayer,
                options: .repeat(.periodic(delay: 1))
            )
    }
}

// MARK: - Preview

#Preview {
    HeaderView()
}
