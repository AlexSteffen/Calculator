//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Alexander Steffen on 26.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *operationHistory;

@property (weak, nonatomic) IBOutlet UILabel *display;
@end
