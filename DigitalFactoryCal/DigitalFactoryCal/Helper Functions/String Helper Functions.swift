//
//  String Helper Functions.swift
//  Calculator
//
//  Created by Barrington Thorpe on 4/1/25.
//

import Foundation

// MARK: - String Utility Functions

/// Collection of helper functions for handling string operations related to calculator input

// MARK: - Character Inspection

/**
 Returns the last character in a string if it exists
 
 - Parameter str: The string to examine
 - Returns: The last character as a String, or empty string if input is empty
 */
func getLastChar(str: String) -> String {
    return str.isEmpty ? "" : String(str.last!)
}

/**
 Checks if the last character in a string equals a specific character
 
 - Parameters:
   - str: The string to examine
   - char: The character to compare against
 - Returns: True if the last character equals the specified character
 */
func lastCharacterIsEqualTo(str: String, char: String) -> Bool {
    let last = getLastChar(str: str)
    return last == char
}

/**
 Checks if the last character in a string is a digit
 
 - Parameter str: The string to examine
 - Returns: True if the last character is a digit (0-9)
 */
func lastCharIsDigit(str: String) -> Bool {
    return "0123456789".contains(getLastChar(str: str))
}

/**
 Checks if the last character in a string is a digit or percent symbol
 
 - Parameter str: The string to examine
 - Returns: True if the last character is a digit or %
 */
func lastCharIsDigitOrPercent(str: String) -> Bool {
    return "0123456789%".contains(getLastChar(str: str))
}

/**
 Checks if the last character in a string is a mathematical operator
 
 - Parameter str: The string to examine
 - Returns: True if the last character is an operator (+, -, ×, ÷)
 */
func lastCharacterIsAnOperator(str: String) -> Bool {
    let last = getLastChar(str: str)
    return operators.contains(last)
}

// MARK: - Formatting Functions

/**
 Formats a double value to a readable string with appropriate decimal places
 
 - Parameter val: The double value to format
 - Returns: A formatted string representation of the number
 */
func formatResult(val: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 16
    
    return numberFormatter.string(from: NSNumber(value: val)) ?? "0"
}
