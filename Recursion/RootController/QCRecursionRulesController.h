//
//  QCRecursionRulesController.h
//  Recursion
//
//  Created by chenbin-c on 2018/9/18.
//  Copyright © 2018年 陈彬. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QCRecursionRulesController : UIViewController
<UITableViewDelegate,
UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
