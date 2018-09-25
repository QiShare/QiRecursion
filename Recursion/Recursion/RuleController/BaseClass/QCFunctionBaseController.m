//
//  QCBaseContentController.m
//  Recursion
//
//  Created by chenbin-c on 2018/9/18.
//  Copyright © 2018年 陈彬. All rights reserved.
//

#import "QCFunctionBaseController.h"

@interface QCFunctionBaseController ()

@end

@implementation QCFunctionBaseController

- (instancetype)init
{
    self = [super initWithNibName:@"QCFunctionBaseController" bundle:nil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.runButton.layer.cornerRadius = 2;
    self.runButton.layer.borderWidth = 0.5;
    self.runButton.layer.borderColor = self.runButton.tintColor.CGColor;
}

- (void)consoleLog:(NSString *)msg
{
    NSMutableString *content = [NSMutableString stringWithString:self.console.text];
    [content appendString:msg];
    self.console.text = content;
    [self autoScrollToLast];
}

- (void)autoScrollToLast
{
//    [self.console scrollRangeToVisible:NSMakeRange(self.console.text.length - 1, 1)];
    CGFloat top = self.console.contentSize.height - self.console.frame.size.height;
    top = top <= 0 ? 0 : top;
    self.console.contentOffset = CGPointMake(0, top);
}

@end
