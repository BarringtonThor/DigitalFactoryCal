//
//  CalcsButtonsView.swift
//  Calculator
//
//  Created by Barrington Thorpe on 3/31/25.
//

import SwiftUI

// MARK: - Models

/// Model for individual calculator buttons
struct CalcButtonModel: Identifiable {
    let id = UUID()
    let calcButton: CalcButton
    var color: Color = foregroundDigitsColor
}

/// Model for rows of calculator buttons
struct RowOfCalcButtonsModel: Identifiable {
    let id = UUID()
    let row: [CalcButtonModel]
}

// MARK: - Calculator Buttons View

struct CalcsButtonsView: View {
    // MARK: - Properties
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    // MARK: - Button Layout Data
    
    /// Portrait mode button layout
    let portraitButtonData: [RowOfCalcButtonsModel] = [
        // First row - Trigonometric functions
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .cosine, color: trigonometric),
            CalcButtonModel(calcButton: .sine, color: trigonometric),
            CalcButtonModel(calcButton: .tangent, color: trigonometric),
            CalcButtonModel(calcButton: .logarithm, color: trigonometric)
        ]),
        // Second row - Clear, negative, percent, divide
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .clear, color: foregroundTopButtonsColor),
            CalcButtonModel(calcButton: .negative, color: foregroundTopButtonsColor),
            CalcButtonModel(calcButton: .percent, color: foregroundTopButtonsColor),
            CalcButtonModel(calcButton: .divide, color: foregroundRightButtonsColor)
        ]),
        // Number pad rows
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .seven),
            CalcButtonModel(calcButton: .eight),
            CalcButtonModel(calcButton: .nine),
            CalcButtonModel(calcButton: .multiply, color: foregroundRightButtonsColor)
        ]),
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .four),
            CalcButtonModel(calcButton: .five),
            CalcButtonModel(calcButton: .six),
            CalcButtonModel(calcButton: .subtract, color: foregroundRightButtonsColor)
        ]),
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .one),
            CalcButtonModel(calcButton: .two),
            CalcButtonModel(calcButton: .three),
            CalcButtonModel(calcButton: .add, color: foregroundRightButtonsColor)
        ]),
        // Bottom row
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .undo),
            CalcButtonModel(calcButton: .zero),
            CalcButtonModel(calcButton: .decimal),
            CalcButtonModel(calcButton: .equal, color: foregroundRightButtonsColor)
        ])
    ]
    
    /// Landscape mode button layout (6x4 grid)
    let landscapeButtonData: [RowOfCalcButtonsModel] = [
        // First row
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .cosine, color: trigonometric),
            CalcButtonModel(calcButton: .sine, color: trigonometric),
            CalcButtonModel(calcButton: .tangent, color: trigonometric),
            CalcButtonModel(calcButton: .logarithm, color: trigonometric),
            CalcButtonModel(calcButton: .clear, color: foregroundTopButtonsColor),
            CalcButtonModel(calcButton: .negative, color: foregroundTopButtonsColor)
        ]),
        // Second row
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .seven),
            CalcButtonModel(calcButton: .eight),
            CalcButtonModel(calcButton: .nine),
            CalcButtonModel(calcButton: .divide, color: foregroundRightButtonsColor),
            CalcButtonModel(calcButton: .percent, color: foregroundTopButtonsColor),
            CalcButtonModel(calcButton: .undo)
        ]),
        // Third row
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .four),
            CalcButtonModel(calcButton: .five),
            CalcButtonModel(calcButton: .six),
            CalcButtonModel(calcButton: .multiply, color: foregroundRightButtonsColor),
            CalcButtonModel(calcButton: .decimal),
            CalcButtonModel(calcButton: .zero)
        ]),
        // Fourth row
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .one),
            CalcButtonModel(calcButton: .two),
            CalcButtonModel(calcButton: .three),
            CalcButtonModel(calcButton: .subtract, color: foregroundRightButtonsColor),
            CalcButtonModel(calcButton: .add, color: foregroundRightButtonsColor),
            CalcButtonModel(calcButton: .equal, color: foregroundRightButtonsColor)
        ])
    ]
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            // Determine orientation based on screen dimensions
            let isLandscape = geometry.size.width > geometry.size.height
            let buttonData = isLandscape ? landscapeButtonData : portraitButtonData
            
            // Calculator grid layout
            Grid {
                ForEach(buttonData) { rowOfCalcButtonsModel in
                    GridRow {
                        ForEach(rowOfCalcButtonsModel.row) { calcButtonModel in
                            calculatorButton(for: calcButtonModel, isLandscape: isLandscape, geometry: geometry)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(isLandscape ? 4 : 12)
            .background(secondaryBackgroundColor.cornerRadius(20))
        }
    }
    
    // MARK: - Helper Views
    
    /// Creates a calculator button with proper sizing based on orientation
    private func calculatorButton(for model: CalcButtonModel, isLandscape: Bool, geometry: GeometryProxy) -> some View {
        Button(action: {
            buttonPressed(calcButton: model.calcButton)
        }, label: {
            ButtonView(
                calcButton: model.calcButton,
                fgColor: model.color,
                bgColor: buttonBackgroundColor)
                .frame(
                    width: isLandscape ? geometry.size.width * 0.15 : nil,
                    height: isLandscape ? geometry.size.height * 0.2 : nil
                )
        })
    }
    
    // MARK: - Button Actions
    
    /// Handles calculator button presses
    func buttonPressed(calcButton: CalcButton) {
        //Logic
        switch calcButton {
        
        case .clear:
            currentComputation = ""
            mainResult = "0"
        
        case .equal, .negative:
            if !currentComputation.isEmpty {
                if !lastCharacterIsAnOperator(str: currentComputation) {
                    let sign = calcButton == .negative ? -1.0 : 1.0
                    
                    mainResult = formatResult(val: sign * calculateResults())
                    
                    if calcButton == .negative {
                        currentComputation = mainResult
                    }
                }
            }
        
        case .decimal:
            if let lastOccurenceOfDecimal = currentComputation.lastIndex(of: ".") {
                if lastCharIsDigit(str: currentComputation) {
                    let startIndex = currentComputation.index(lastOccurenceOfDecimal, offsetBy: 1)
                    let endIndex = currentComputation.endIndex
                    let range = startIndex..<endIndex
                    let rightSubString = String(currentComputation[range])
                    // Only have digits to the right of decimal
                    // That means do not add another decimal
                    // Otherwise we can add another deciaml point
                    
                    if Int(rightSubString) == nil && !rightSubString.isEmpty {
                        currentComputation += "."
                    }
                }
            }  else {
                if currentComputation.isEmpty {
                    currentComputation += "0."
                } else if lastCharIsDigit(str: currentComputation) {
                    currentComputation += "."
                }
            }
            
        case .percent:
            if lastCharIsDigit(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
        
        case .undo:
            currentComputation = String(currentComputation.dropLast())
            
        case .add, .subtract, .multiply, .divide:
            if lastCharIsDigitOrPercent(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
            
        case .cosine, .sine, .tangent, .logarithm:
            if currentComputation.isEmpty {
                currentComputation = "0"
            }
            
            if lastCharIsDigit(str: currentComputation) {
                let currentValue = Double(currentComputation) ?? 0.0
                var result: Double = 0.0
                
                switch calcButton {
                case .cosine:
                    // Convert degrees to radians and calculate cosine
                    result = cos(currentValue * .pi / 180)
                case .sine:
                    // Convert degrees to radians and calculate sine
                    result = sin(currentValue * .pi / 180)
                case .tangent:
                    // Convert degrees to radians and calculate tangent
                    result = tan(currentValue * .pi / 180)
                case .logarithm:
                    // Natural logarithm
                    if currentValue > 0 {
                        result = log(currentValue)
                    } else {
                        mainResult = "Error"
                        return
                    }
                default:
                    break
                }
                
                mainResult = formatResult(val: result)
                currentComputation = mainResult
            }
            
        default:
            appendToCurrentComputation(calcButton: calcButton)
        }
    }
    
    // MARK: - Implenments the actual computation
    
    func calculateResults() -> Double {
        let visibleWorkings: String = currentComputation
        var workings = visibleWorkings.replacingOccurrences(of: "%", with: "*0.01")
        
        // Fix multiplication and division symbol replacements
        workings = workings.replacingOccurrences(of: "×", with: "*")
        workings = workings.replacingOccurrences(of: "÷", with: "/")
        
        //If number is "35." this will be replaced by "35.0"
        if getLastChar(str: visibleWorkings) == "." {
            workings += "0"
        }
        
        // Actual Computation
        let expr = NSExpression(format: workings)
        let exprValue = expr.expressionValue(with: nil, context: nil) as! Double
        
        return exprValue
    }
    
    // MARK: - AppendToCurrentComputation
    
    func appendToCurrentComputation(calcButton: CalcButton) {
        currentComputation += calcButton.rawValue
    }
}

// MARK: - Preview

#Preview {
    CalcsButtonsView(currentComputation: .constant("5+1"), mainResult: .constant("6"))
}
