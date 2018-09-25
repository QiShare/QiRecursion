//
//  QCMathFunctionController.m
//  Recursion
//
//  Created by chenbin-c on 2018/9/18.
//  Copyright © 2018年 陈彬. All rights reserved.
//

#import "QCMathFunctionController.h"

@interface QCMathFunctionController ()

@end

@implementation QCMathFunctionController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    NSString *functionName = [NSString stringWithFormat:@"mathFunction(%td)", self.calculateValue];
    self.functionNameLabel.text = functionName;
    
    NSString *functionDetail = @"- (NSInteger)mathFunction:(NSInteger)x\r\n{\r\n    if (x == 0) {\r\n        return 0;\r\n   }\r\n   return 2 * [self mathFunction:x-1] + x * x;\r\n}";
    self.functionDetailLabel.text = functionDetail;
    
    [self.runButton addTarget:self action:@selector(runButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 数学函数F(X)=2*F(X-1) + X*X
 
 @param x 整数
 @return 经过函数计算后的值
 */
- (NSInteger)mathFunction:(NSInteger)x
{
    if (x == 0) {
        return 0;
    }
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *msg = [NSString stringWithFormat:@"%@   mathFunction(%td) = 2*mathFunction:(%td) + %td*%td \r\n", [NSDate date], x, x-1, x, x];
        [self consoleLog:msg];
        dispatch_semaphore_signal(sema);
    });
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    return 2 * [self mathFunction:x-1] + x * x;
}

- (void)runButtonPressed:(id)sender
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSUInteger num = [self mathFunction:self.calculateValue];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *msg = [NSString stringWithFormat:@"%@   mathFunction(%td) = %td \r\n", [NSDate date], self.calculateValue, num];
            [self consoleLog:msg];
        });
    });
}

@end
