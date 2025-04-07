//
//  ComputationView.swift
//  Calculator
//
//  Created by Barrington Thorpe on 3/31/25.
//

import SwiftUI

/// Displays the calculation expression and result
/// This view shows both the current computation string and the final result
struct ComputationView: View {
    // MARK: - Properties

    /// The current mathematical expression being calculated (e.g., "5+1")
    let currentComputation: String

    /// The result of the calculation (e.g., "6")
    let mainResult: String

    // MARK: - Body

    var body: some View {
        VStack(spacing: 10) {
            // Expression display (upper row)
            expressionText

            // Result display (lower row)
            resultText
        }
        .padding(.horizontal)
    }

    // MARK: - Components

    /// Displays the current computation expression
    private var expressionText: some View {
        HStack {
            Spacer()
            // Pushes text to right side

            Text(currentComputation)
                .foregroundColor(foregroundDigitsColor)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            // Allows text to shrink if needed
        }
    }

    /// Displays the computation result
    private var resultText: some View {
        HStack {
            Spacer()
            // Pushes text to right side

            Text(mainResult)
                .foregroundColor(foregroundDigitsColor)
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            // Allows text to shrink if needed
        }
    }
}

// MARK: - Preview

#Preview {
    ComputationView(currentComputation: "5+1", mainResult: "6")
}
