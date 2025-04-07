//
//  ViewExtension.swift
//  DigitalFactoryCal
//
//  Created by Barrington Thorpe on 4/4/25.
//

import SwiftUI

// MARK: - Device Rotation View Extension

extension View {
    /// Adds device rotation handling to any view
    /// - Parameter action: Closure to execute when device rotation changes
    /// - Returns: Modified view that responds to rotation changes
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void)
        -> some View
    {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

// MARK: - Device Rotation View Modifier

/// Custom view modifier that handles device rotation notifications
struct DeviceRotationViewModifier: ViewModifier {
    /// Action to perform when device rotation changes
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            // Set up the view
            .onAppear()
            // Listen for device rotation notifications
            .onReceive(
                NotificationCenter.default.publisher(
                    for: UIDevice.orientationDidChangeNotification
                )
            ) { _ in
                // Execute the provided action with current device orientation
                action(UIDevice.current.orientation)
            }
    }
}
