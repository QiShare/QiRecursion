//
//  QCRecursionRuleContentController.m
//  Recursion
//
//  Created by chenbin-c on 2018/9/18.
//  Copyright © 2018年 陈彬. All rights reserved.
//

#import "QCRecursionRuleContentController.h"
#import "QCFibFunctionController.h"
#import "QCMathFunctionController.h"
#import "QCNonBaseCaseFibFunctionController.h"
#import "QCNonRecursiveFibFunctionController.h"

@interface QCRecursionRuleContentController ()

@property (nonatomic, strong) UIViewController *leftViewController;
@property (nonatomic, strong) UIViewController *rightViewController;

@end

@implementation QCRecursionRuleContentController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSeparator];
}

- (void)addSeparator
{
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, self.view.frame.size.height)];
    separator.backgroundColor = [UIColor grayColor];
    separator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    separator.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:separator];
}

- (void)resetContentWithRule:(NSString *)rule
{
    [self.leftViewController.view removeFromSuperview];
    [self.leftViewController removeFromParentViewController];
    
    [self.rightViewController.view removeFromSuperview];
    [self.rightViewController removeFromParentViewController];
    
    if ([rule isEqualToString:@"基准情形"]) {
        
        QCFibFunctionController *fibVC = [[QCFibFunctionController alloc] init];
        fibVC.calculateValue = 1;
        self.leftViewController = fibVC;
        
        QCNonBaseCaseFibFunctionController *nonBaseCaseFibVC = [[QCNonBaseCaseFibFunctionController alloc] init];
        nonBaseCaseFibVC.calculateValue = 1;
        self.rightViewController = nonBaseCaseFibVC;
        
    } else if ([rule isEqualToString:@"不断推进"]) {
        
        QCMathFunctionController *mathVC = [[QCMathFunctionController alloc] init];
        mathVC.calculateValue = 5;
        self.leftViewController = mathVC;
        
        QCMathFunctionController *wrongMathVC = [[QCMathFunctionController alloc] init];
        wrongMathVC.calculateValue = -1;
        self.rightViewController = wrongMathVC;
        
    } else if ([rule isEqualToString:@"设计法则"]) {
        
        QCFibFunctionController *fibVC = [[QCFibFunctionController alloc] init];
        fibVC.calculateValue = 2000000;
        self.leftViewController = fibVC;
        
        QCNonRecursiveFibFunctionController *nonRecursiveFibVC = [[QCNonRecursiveFibFunctionController alloc] init];
        nonRecursiveFibVC.calculateValue = 2000000;
        self.rightViewController = nonRecursiveFibVC;
        
        
    } else if ([rule isEqualToString:@"合成效益法则"]) {
        
        QCFibFunctionController *fibVC = [[QCFibFunctionController alloc] init];
        fibVC.calculateValue = 40;
        self.leftViewController = fibVC;
        
        QCNonRecursiveFibFunctionController *nonRecursiveFibVC = [[QCNonRecursiveFibFunctionController alloc] init];
        nonRecursiveFibVC.calculateValue = 40;
        self.rightViewController = nonRecursiveFibVC;
    }
    
    CGFloat width = self.view.frame.size.width/2 - 1;
    CGFloat height = self.view.frame.size.height;
    self.leftViewController.view.frame = CGRectMake(0, 0, width, height);
    self.rightViewController.view.frame = CGRectMake(self.view.frame.size.width - width, 0, width, height);
    
    [self.view addSubview:self.leftViewController.view];
    [self addChildViewController:self.leftViewController];
    
    [self.view addSubview:self.rightViewController.view];
    [self addChildViewController:self.rightViewController];
}

@end
