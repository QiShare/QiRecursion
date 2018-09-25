//
//  QCBaseContentController.h
//  Recursion
//
//  Created by chenbin-c on 2018/9/18.
//  Copyright © 2018年 陈彬. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QCFunctionBaseController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *functionDetailLabel;
@property (weak, nonatomic) IBOutlet UITextView *console;
@property (weak, nonatomic) IBOutlet UILabel *functionNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *runButton;

- (void)consoleLog:(NSString *)msg;

@end

NS_ASSUME_NONNULL_END
