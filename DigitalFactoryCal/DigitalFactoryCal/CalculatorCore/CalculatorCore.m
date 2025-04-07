#import "CalculatorCore.h"
#import <math.h>

@implementation CalculatorCore

#pragma mark - Singleton Instance

/// Shared instance of the calculator core
static CalculatorCore *sharedInstance = nil;

/// Returns the shared instance of CalculatorCore (thread-safe)
+ (CalculatorCore *)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Expression Evaluation

/// Evaluates a mathematical expression string and returns the result
/// @param expression The mathematical expression to evaluate
/// @param error Pointer to store any error that occurs during evaluation
/// @return The result of the expression evaluation
- (double)evaluateExpression:(NSString *)expression error:(NSError **)error {
    // Create an NSExpression object from the input string
    NSExpression *expr = [NSExpression expressionWithFormat:expression];
    
    @try {
        // Attempt to evaluate the expression
        NSNumber *result = [expr expressionValueWithObject:nil context:nil];
        return result.doubleValue;
    }
    @catch (NSException *exception) {
        // Handle any errors during evaluation
        if (error) {
            NSDictionary *userInfo = @{
                NSLocalizedDescriptionKey: @"Invalid expression"
            };
            *error = [NSError errorWithDomain:@"CalculatorCore"
                                        code:1
                                    userInfo:userInfo];
        }
        return 0.0;
    }
}

#pragma mark - Trigonometric Functions

/// Calculates the cosine of a given value
/// @param value The angle in radians
/// @return The cosine of the angle
- (double)cosine:(double)value {
    return cos(value);
}

/// Calculates the sine of a given value
/// @param value The angle in radians
/// @return The sine of the angle
- (double)sine:(double)value {
    return sin(value);
}

/// Calculates the tangent of a given value
/// @param value The angle in radians
/// @return The tangent of the angle
- (double)tangent:(double)value {
    return tan(value);
}

@end
