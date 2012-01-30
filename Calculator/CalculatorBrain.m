//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Alexander Steffen on 26.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"


@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *programStack;

@end



@implementation CalculatorBrain
@synthesize programStack = _programStack;

-(NSMutableArray *)programStack
{
    if (!_programStack) {
        _programStack = [[NSMutableArray alloc] init];
    }
    return _programStack;
}


-(void)pushOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];

    [self.programStack addObject:operandObject];
}


-(double)performOperation:(NSString *)operation
{
    
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
    
}


-(id)program 
{
    return [self.programStack copy];
}


+ (NSString *) descriptionOfProgram:(id)program
{
    return @"Implement in Assignment 2";
}

+ (double) popOperandOffStack:(NSMutableArray *)stack
{
    double result = 0;
    
    id topOfStack = [stack lastObject];
    if (topOfStack) [stack removeLastObject];
    
    if([topOfStack isKindOfClass:[NSNumber class]]) {
        result = [topOfStack doubleValue];
    }
    else if ([topOfStack isKindOfClass:[NSString class]]) {
        
        NSString *operation = topOfStack;
        
        if ([operation isEqualToString:@"+"]) {
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        } 
        else if ([operation isEqualToString:@"-"]) 
        {
            double subtrahend = [self popOperandOffStack:stack];
            result = [self popOperandOffStack:stack] - subtrahend;
        }
        else if ([operation isEqualToString:@"*"]) 
        {
            result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
        }
        else if ([operation isEqualToString:@"/"]) 
        {
            double divisor = [self popOperandOffStack:stack];
            if (divisor != 0) {
                result = [self popOperandOffStack:stack] / divisor;
            }
            else
                return 0;
        }
        else if ([operation isEqualToString:@"sin"])
        {
            result = sin([self popOperandOffStack:stack]);
        }
        else if ([operation isEqualToString:@"cos"])
        {
            result = cos([self popOperandOffStack:stack]);
        }
        else if ([operation isEqualToString:@"sqrt"])
        {
            result = sqrt([self popOperandOffStack:stack]);
        }

    }
    
    
    return result;
}

+(double)runProgram:(id)program
{
    NSMutableArray *stack;
    if([program isKindOfClass:[NSArray class]])
        {
            stack = [program mutableCopy];
        }
   return [self popOperandOffStack:stack];
}
    

-(void)clearStacks 
{    
    [self.programStack removeAllObjects];
}

@end
