//
//  QCFibFunctionController.m
//  Recursion
//
//  Created by chenbin-c on 2018/9/18.
//  Copyright © 2018年 陈彬. All rights reserved.
//

#import "QCFibFunctionController.h"

@interface QCFibFunctionController ()

@end

@implementation QCFibFunctionController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    NSString *functionName = [NSString stringWithFormat:@"Fibonacci(%td)", self.calculateValue];
    self.functionNameLabel.text = functionName;
    
    NSString *functionDetail = @"- (NSUInteger)Fibonacci:(NSUInteger)x\r\n{\r\n    if (x <= 1) {\r\n        return 1;\r\n   }\r\n   return [self Fibonacci:x-1] + [self Fibonacci:x-2];\r\n}";
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
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *msg = [NSString stringWithFormat:@"%@   Fibonacci(%td) = Fibonacci(%td) + Fibonacci(%td) \r\n", [NSDate date], x, x-1, x-2];
        [self consoleLog:msg];
        dispatch_semaphore_signal(sema);
    });
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    return [self Fibonacci:x-1] + [self Fibonacci:x-2];
}

- (void)runButtonPressed:(id)sender
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSUInteger fnum = [self Fibonacci:self.calculateValue];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *msg = [NSString stringWithFormat:@"%@   Fibonacci(%td) = %td \r\n", [NSDate date], self.calculateValue, fnum];
            [self consoleLog:msg];
        });
    });
}

@end
