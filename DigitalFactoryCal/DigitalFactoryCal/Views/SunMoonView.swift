//
//  SunMoonView.swift
//  Calculator
//
//  Created by Barrington Thorpe on 3/31/25.
//

import SwiftUI

/// A toggle view that displays sun and moon icons for switching between light and dark modes
struct SunMoonView: View {
    // MARK: - Properties
    
    /// Determines which icon is highlighted (true = light mode, false = dark mode)
    var lightMode: Bool
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 30) {
            // Sun icon - highlighted when in light mode
            sunIcon
            
            // Moon icon - highlighted when in dark mode
            moonIcon
        }
        .padding()
        .background(secondaryBackgroundColor)
        .cornerRadius(20)
    }
    
    // MARK: - Helper Views
    
    /// Sun icon with appropriate styling based on current mode
    private var sunIcon: some View {
        Image(systemName: "sun.min")
            .imageScale(.large)
            .foregroundColor(lightMode ? sunOrMoonSelectedColor : sunOrMoonNotSelectedColor)
            .symbolEffect(.wiggle.byLayer, options: .repeat(.periodic(delay: 1)))
    }
    
    /// Moon icon with appropriate styling based on current mode
    private var moonIcon: some View {
        Image(systemName: "moon")
            .imageScale(.large)
            .foregroundColor(lightMode ? sunOrMoonNotSelectedColor : sunOrMoonSelectedColor)
            .symbolEffect(.wiggle.byLayer, options: .repeat(.periodic(delay: 1)))
    }
}

// MARK: - Preview

#Preview {
    VStack {
        SunMoonView(lightMode: true)
        SunMoonView(lightMode: false)
    }
}
