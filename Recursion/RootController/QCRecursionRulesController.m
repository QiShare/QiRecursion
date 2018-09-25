//
//  QCRecursionRulesController.m
//  Recursion
//
//  Created by chenbin-c on 2018/9/18.
//  Copyright © 2018年 陈彬. All rights reserved.
//

#import "QCRecursionRulesController.h"
#import "QCRecursionRuleContentController.h"

@interface QCRecursionRulesController ()

@property (nonatomic, strong) NSArray *rules;

@end

@implementation QCRecursionRulesController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initDataSource];
    [self registerTableViewCell];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
}

- (void)initDataSource
{
    self.rules = @[@"基准情形", @"不断推进", @"设计法则", @"合成效益法则"];
}

- (void)registerTableViewCell
{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RuleCell"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rules.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RuleCell"];
    cell.textLabel.text = self.rules[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QCRecursionRuleContentController *contentVC = (QCRecursionRuleContentController *)self.splitViewController.childViewControllers.lastObject;
    [contentVC resetContentWithRule:self.rules[indexPath.row]];
}


@end
