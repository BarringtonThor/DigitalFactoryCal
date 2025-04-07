# Digital Factory Calculator

A modern SwiftUI calculator application featuring a responsive design that adapts to both portrait and landscape orientations, with a customizable light/dark theme.

## Features

- 📱 Responsive layout that adapts to both portrait and landscape orientations
- 🌓 Toggle between light and dark mode
- 🧮 Real-time calculation display
- 💫 Smooth animations for theme switching
- 📊 Clear computation history display

## Technical Details

- Built with SwiftUI
- Supports iOS devices
- Uses MVVM architecture
- Includes Objective-C calculator core for computations
- Implements device rotation handling
- Uses SwiftUI environment for theme management

## Project Structure

```
DigitalFactoryCal/
├── CalculatorCore/
│   └── CalculatorCore.m
├── Constants/
│   ├── Color Constants.swift
│   └── Enumerations.swift
├── Extensions/
│   └── ViewExtension.swift
├── Helper Functions/
│   └── String Helper Functions.swift
└── Views/
    ├── ButtonView.swift
    ├── CalcsButtonsView.swift
    ├── ComputationView.swift
    ├── HeaderView.swift
    ├── MainCalculatorView.swift
    └── SunMoonView.swift
```

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.0+

## Installation

1. Clone the repository
2. Open `DigitalFactoryCal.xcodeproj` in Xcode
3. Build and run the project

## License

This project is licensed under the MIT License - see the LICENSE file for details.