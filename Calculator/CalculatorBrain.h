//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Alexander Steffen on 26.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;
- (void)clearStacks;

@property (readonly) id program; 

+ (double)runProgram:(id)program;
+ (NSString *)descriptionOfProgram:(id)program;

@end
