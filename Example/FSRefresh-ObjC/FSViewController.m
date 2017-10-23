//
//  FSViewController.m
//  FSRefresh-ObjC
//
//  Created by Allen on 10/23/2017.
//  Copyright (c) 2017 Allen. All rights reserved.
//

#import "FSViewController.h"
#import "UIScrollView+FSRefresh.h"

@interface FSViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FSViewController

#pragma mark - Life cycle

- (void)dealloc
{
    NSLog(@"[%@ dealloc]", NSStringFromClass(self.class));
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    if (@available(iOS 11.0, *)) {
//        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    } else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
    
    [self.view addSubview:self.tableView];
    CGFloat margin = 50.0;
    if (@available(iOS 11.0, *)) {
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view.safeAreaLayoutGuide
                                                              attribute:NSLayoutAttributeTop
                                                             multiplier:1.0
                                                               constant:margin]];
    } else {
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.topLayoutGuide
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1.0
                                                               constant:margin]];
    }
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_tableView]-margin-|"
                                                                      options:kNilOptions
                                                                      metrics:@{@"margin" : @(margin)}
                                                                        views:NSDictionaryOfVariableBindings(_tableView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_tableView)]];
}

#pragma mark - Getter

- (UITableView *)tableView
{
    if (_tableView) {
        return _tableView;
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.clipsToBounds = NO;
    _tableView.backgroundColor = UIColor.whiteColor;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.layer.borderWidth = 2.0;
    _tableView.layer.borderColor = UIColor.redColor.CGColor;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    return _tableView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kCellId"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第 %@ 行", @(indexPath.row + 1)];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

@end
