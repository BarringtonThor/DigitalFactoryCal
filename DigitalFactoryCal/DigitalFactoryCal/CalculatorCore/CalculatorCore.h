#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * A core calculator engine that provides basic mathematical operations.
 */
@interface CalculatorCore : NSObject

/**
 * Returns the shared calculator instance.
 */
+ (instancetype)shared;

/**
 * Evaluates a mathematical expression string.
 * @param expression The expression to evaluate
 * @param error Error information if the evaluation fails
 * @return The result of the expression evaluation or 0.0 if an error occurs
 */
- (double)evaluateExpression:(NSString *)expression error:(NSError * _Nullable * _Nullable)error;

/**
 * Calculates the cosine of a value.
 */
- (double)cosine:(double)value;

/**
 * Calculates the sine of a value.
 */
- (double)sine:(double)value;

/**
 * Calculates the tangent of a value.
 */
- (double)tangent:(double)value;

@end

NS_ASSUME_NONNULL_END
