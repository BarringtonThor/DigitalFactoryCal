//
//  Enumerations.swift
//  DigitalFactoryCal
//
//  Created by Barrington Thorpe on 4/1/25.
//

import Foundation

// MARK: - Calculator Operations

/// Represents the different types of calculator operations
enum Operations {
    /// Basic arithmetic operations
    case add, subtract, multiply, divide

    /// Equals operation
    case equal

    /// Trigonometric operations
    case cos, sin, tan

    /// Logarithmic operation
    case log

    /// No operation
    case none
}

// MARK: - Calculator Buttons

/// Represents all possible calculator buttons
enum CalcButton: String {
    // MARK: Number Buttons
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"

    // MARK: Basic Operations
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "÷"
    case equal = "="

    // MARK: Special Functions
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "IMGplus.forwardslash.minus"
    case undo = "IMGarrow.counterclockwise"

    // MARK: Scientific Operations
    case cosine = "cos"
    case sine = "sin"
    case tangent = "tan"
    case logarithm = "log"
}

// MARK: - Constants

/// Array of operator buttons for validation
let enumOperators: [CalcButton] = [
    .add, .subtract, .multiply, .divide,
    .cosine, .sine, .tangent, .logarithm,
]

/// Multiplication symbol constant
let multiplySymbol: String = "×"

/// Division symbol constant
let divisionSymbol: String = "÷"

/// String containing all basic arithmetic operators
let operators: String = "+-\(multiplySymbol)\(divisionSymbol)"
