//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Alexander Steffen on 26.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"
#import <math.h>
@interface CalculatorViewController() 

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@property (nonatomic) BOOL dotAdded;

@end

@implementation CalculatorViewController

@synthesize operationHistory;
@synthesize display;
@synthesize userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;
@synthesize dotAdded;

- (CalculatorBrain *)brain
{
    if (!_brain) {
        _brain = [[CalculatorBrain alloc] init];
        return _brain;
    }
    else
    {
        return _brain;
    }
}


- (IBAction)digitPressed:(UIButton *)sender 
{
    NSString *digit;
    if ([[sender currentTitle] isEqualToString:@"pi"])
    {
        digit = [NSString stringWithFormat:@"%f", M_PI];
    }
    else
    {
        digit = [sender currentTitle];
    }

    if (self.userIsInTheMiddleOfEnteringANumber) 
    {
        self.display.text = [self.display.text stringByAppendingString:digit]; //[self.display setText:[self.display.text stringByAppendingString:digit]];
    }
    else
    {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}
- (IBAction)dotPressed 
{
    if (userIsInTheMiddleOfEnteringANumber && !dotAdded) {
        self.display.text = [self.display.text stringByAppendingString:@"."];
        dotAdded = YES;
    }
}

- (IBAction)enterPressed 
{
    self.operationHistory.text = [self.operationHistory.text stringByAppendingString:[self.display.text stringByAppendingString:@" "]];
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.dotAdded = NO;
}


- (IBAction)operationPressed:(UIButton *)sender 
{
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self enterPressed];
    }
    self.operationHistory.text = [self.operationHistory.text stringByAppendingString:[[sender currentTitle] stringByAppendingString:@" "]];
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)ClearPressed 
{
    self.operationHistory.text = @"";
}
@end
