//
//  MainCalculatorView.swift
//  DigitalFactoryCal
//
//  Created by Barrington Thorpe on 4/4/25.
//

import SwiftUI

/// Main view for the calculator application
/// Handles the overall UI layout and state management
struct MainCalculatorView: View {
    // MARK: - Properties

    /// Controls light/dark mode appearance
    @State private var lightMode: Bool = true

    /// Displays the current calculation result
    @State private var mainResult: String = "0"

    /// Displays the current expression being calculated
    @State private var currentComputation: String = ""

    /// Used to determine device orientation for responsive layout
    @State private var orientation = UIDeviceOrientation.portrait

    // MARK: - Body

    var body: some View {
        GeometryReader { geometry in
            // Determine orientation based on dimensions
            let isLandscape = geometry.size.width > geometry.size.height

            // Main container with background color
            ZStack {
                // Apply background color to entire screen
                primaryBackgroundColor.ignoresSafeArea()

                // Select appropriate layout based on orientation
                if !isLandscape {
                    portraitLayout
                } else {
                    landscapeLayout(geometry: geometry)
                }
            }
        }
        // Apply color scheme based on theme selection
        .environment(\.colorScheme, lightMode ? .light : .dark)
        // Listen for device rotation changes
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }

    // MARK: - Layout Components

    /// Portrait mode layout (vertical orientation)
    private var portraitLayout: some View {
        VStack {
            // Top header section
            headerSection

            Spacer()

            // Display area for calculations
            ComputationView(
                currentComputation: currentComputation,
                mainResult: mainResult
            )

            Spacer()

            // Calculator buttons
            buttonsSection
        }
        .padding()
    }

    /// Landscape mode layout (horizontal orientation)
    private func landscapeLayout(geometry: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            // Top header section
            headerSection
                .padding(.bottom, 5)

            // Main content section
            VStack(spacing: 10) {
                // Calculation display
                ComputationView(
                    currentComputation: currentComputation,
                    mainResult: mainResult
                )
                .padding(.horizontal, 30)

                Spacer()

                // Calculator buttons
                buttonsSection
                    .padding(.horizontal, 45)
                    .frame(maxHeight: geometry.size.height * 0.65)
                // Limit height to prevent overflow
            }
        }
        .padding()
        .edgesIgnoringSafeArea(.bottom)
        // Allow content to extend to bottom edge
    }

    // MARK: - Reusable View Components

    /// Header section with title and theme toggle
    private var headerSection: some View {
        HStack {
            HeaderView()
            themeToggleButton
            Spacer()
        }
    }

    /// Calculator buttons component
    private var buttonsSection: some View {
        CalcsButtonsView(
            currentComputation: $currentComputation,
            mainResult: $mainResult
        )
    }

    /// Theme toggle button with sun/moon icons
    private var themeToggleButton: some View {
        SunMoonView(lightMode: lightMode)
            .onTapGesture {
                withAnimation {
                    lightMode.toggle()
                }
            }
    }
}

// MARK: - Preview

#Preview {
    MainCalculatorView()
}
