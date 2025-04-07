//
//  ButtonView.swift
//  Calculator
//
//  Created by Barrington Thorpe on 4/1/25.
//

import SwiftUI

/// A custom button view for calculator buttons
/// Handles displaying either text or system images based on the button type
struct ButtonView: View {
    // MARK: - Properties
    
    /// The calculator button type to display
    let calcButton: CalcButton
    
    /// The foreground (text/icon) color of the button
    let fgColor: Color
    
    /// The background color of the button
    let bgColor: Color
    
    // MARK: - Computed Properties
    
    /// Returns a system image name if the button should display an image
    /// Returns nil if the button should display text instead
    var systemImage: String? {
        let value = calcButton.rawValue
        return value.contains("IMG") ? value.replacingOccurrences(of: "IMG", with: "") : nil
    }
    
    /// Returns the text to display on the button
    /// Returns nil if the button should display an image instead
    var text: String? {
        let value = calcButton.rawValue
        return value.contains("IMG") ? nil : value
    }
    
    /// Calculates the appropriate button dimensions based on device orientation
    /// Makes buttons smaller in landscape mode to fit more buttons on screen
    var buttonDim: CGFloat {
        // Check if width is greater than height to determine landscape
        let isLandscape = UIScreen.main.bounds.width > UIScreen.main.bounds.height
        return isLandscape ? UIScreen.main.bounds.width / 20 : UIScreen.main.bounds.width / 5
    }
    
    // MARK: - Body
    
    var body: some View {
        buttonContent
            .applyButtonStyling(dimension: buttonDim, foreground: fgColor, background: bgColor)
    }
    
    // MARK: - Components
    
    /// The content to display inside the button (either text or image)
    private var buttonContent: some View {
        ZStack {
            // Text is displayed when text property is not nil
            if let text = text {
                Text(text)
            }
            
            // Image is displayed when systemImage property is not nil
            if let systemImage = systemImage {
                Image(systemName: systemImage)
            }
        }
        .font(.title2)
        .fontWeight(.semibold)
    }
}

// MARK: - View Modifiers

/// Extension to apply consistent styling to button content
extension View {
    /// Applies standard calculator button styling
    func applyButtonStyling(dimension: CGFloat, foreground: Color, background: Color) -> some View {
        self
            .frame(width: dimension, height: dimension)
            .foregroundColor(foreground)
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: background.opacity(0.5), radius: 3, x: 5, y: 5)
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 20) {
        // Preview with text button
        ButtonView(calcButton: .one, fgColor: foregroundDigitsColor, bgColor: buttonBackgroundColor)
    }
}
