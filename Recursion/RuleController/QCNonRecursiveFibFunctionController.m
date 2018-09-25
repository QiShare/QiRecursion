//
//  QCNonRecursiveFibFunctionController.m
//  Recursion
//
//  Created by chenbin-c on 2018/9/18.
//  Copyright © 2018年 陈彬. All rights reserved.
//

#import "QCNonRecursiveFibFunctionController.h"

@interface QCNonRecursiveFibFunctionController ()

@end

@implementation QCNonRecursiveFibFunctionController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}


- (void)initUI
{
    NSString *functionName = [NSString stringWithFormat:@"Fibonacci(%td)", self.calculateValue];
    self.functionNameLabel.text = functionName;
    
    NSString *functionDetail = @"- (NSUInteger)Fibonacci:(NSUInteger)x\r\n{\r\n    if (x <= 1) {\r\n        return 1;\r\n   }\r\n   NSUInteger fibNum = 1;\r\n    NSUInteger firstNum = 1;\r\n    NSUInteger secondNum = 1;\r\n    for (NSUInteger i = 2; i <= x; i++) {\r\n        fibNum = firstNum + secondNum;\r\n        firstNum = secondNum;\r\n        secondNum = fibNum;\r\n    }\r\n    return fibNum;\r\n}";
    self.functionDetailLabel.text = functionDetail;
    
    [self.runButton addTarget:self action:@selector(runButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 斐波那契数
 
 @param x 自然数，即0，1，2，3，4...
 @return 当x等于0或1时，返回值为1，否则返回F(X)=F(X-1)+F(X-2)
 */
- (NSUInteger)Fibonacci:(NSUInteger)x
{
    if (x <= 1) {
        return 1;  //该if片段语句就是基准情形
    }
    
    NSUInteger fibNum = 1;
    NSUInteger firstNum = 1;
    NSUInteger secondNum = 1;
    for (NSUInteger i = 2; i <= x; i++) {
        fibNum = firstNum + secondNum;
        firstNum = secondNum;
        secondNum = fibNum;
    }
    
    return fibNum;
}

- (void)runButtonPressed:(id)sender
{
    NSUInteger fnum = [self Fibonacci:self.calculateValue];
    NSString *msg = [NSString stringWithFormat:@"%@   Fibonacci(%td) = %td \r\n", [NSDate date], self.calculateValue, fnum];
    [self consoleLog:msg];
}

@end
