//
//  PersonalCenterViewController.m
//  PersonalCenter
//
//  Created by colorPen on 16/1/11.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PersonalCenterCell.h"
#import "PersonalCenterSectionHeaderView.h"
#import "PersonalCenterHeaderView.h"
#import "PersonalCenterFooterView.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height


static NSString * const PersonalCenterCellID = @"PersonalCenterCellID";

static CGFloat const PersonalCenterCellHeight = 50.0f;
static CGFloat const PersonalCenterSectionHeaderViewHeight = 40.0f;
static CGFloat const PersonalCenterSectionFooterViewHeight = 30.0f;
static CGFloat const PersonalCenterHeaderHeight = 160.0f;// 头像
static CGFloat const PersonalCenterFooterHeight = 80.0f;// 退出

@interface PersonalCenterViewController ()<UITableViewDataSource,UITableViewDelegate>

// 返回按钮
@property (nonatomic, strong) UIButton * backButton;

@property (nonatomic, strong) UITableView * mainTableView;

@property (nonatomic, strong) NSArray * rowTitleArray;

@property (nonatomic, strong) NSArray * sectionTitleArray;

// 头像
@property (nonatomic, strong) PersonalCenterHeaderView * headerView;
// 退出按钮
@property (nonatomic, strong) PersonalCenterFooterView * footerView;

@end

@implementation PersonalCenterViewController

#pragma mark - Life cycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self mainTableView];
    
    // 头像视图
    [self headerView];
    
    // 退出登录
    [self footerView];
    
    [self backButton];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.rowTitleArray count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.rowTitleArray[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:PersonalCenterCellID forIndexPath:indexPath];
 
    [cell loadPersonalCenterCellWithTitleArray:self.rowTitleArray indexPath:indexPath];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect rect = CGRectMake(0, 0, kWidth, PersonalCenterSectionHeaderViewHeight);
    return [[PersonalCenterSectionHeaderView alloc]initWithFrame:rect title:self.sectionTitleArray[section]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了Cell__section_%@ row_%@",@(indexPath.section),@(indexPath.row));
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return PersonalCenterCellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return PersonalCenterSectionHeaderViewHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return (section == self.rowTitleArray.count - 1) ? PersonalCenterSectionFooterViewHeight : 0.001;
}


#pragma mark - Lazy load
- (PersonalCenterHeaderView *)headerView
{
    if (!_headerView)
    {
        CGRect rect = CGRectMake(0, 0, kWidth, PersonalCenterHeaderHeight);
        _headerView = [[PersonalCenterHeaderView alloc]initWithFrame:rect];
        [_headerView setHeaderClick:^{
            NSLog(@"点击了头像");
        }];
        self.mainTableView.tableHeaderView = _headerView;
    }
    return _headerView;
}

- (PersonalCenterFooterView *)footerView
{
    if (!_footerView)
    {
        CGRect rect = CGRectMake(0, 0, kWidth, PersonalCenterFooterHeight);
        _footerView = [[PersonalCenterFooterView alloc]initWithFrame:rect];
        [_footerView setFooterClick:^{
            NSLog(@"点击退出按钮");
        }];
        self.mainTableView.tableFooterView = _footerView;
    }
    return _footerView;
}

- (UITableView *)mainTableView
{
    if (!_mainTableView)
    {
        CGRect rect = CGRectMake(0, 0, kWidth, kHeight);
        _mainTableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStyleGrouped];
        _mainTableView.backgroundColor = [UIColor colorWithRed:0.96 green:0.97 blue:0.97 alpha:1];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.dataSource = self;
        _mainTableView.delegate = self;
        [self.view addSubview:_mainTableView];
        
        [_mainTableView registerClass:[PersonalCenterCell class] forCellReuseIdentifier:PersonalCenterCellID];
    }
    return _mainTableView;
}

- (NSArray *)sectionTitleArray
{
    if (!_sectionTitleArray)
    {
        _sectionTitleArray = @[@"帮助及反馈",@"设置"];
    }
    return _sectionTitleArray;
}

- (NSArray *)rowTitleArray
{
    if (!_rowTitleArray)
    {
        _rowTitleArray = @[@[@"支持我们",@"联系我们"],@[@"清空缓存"]];
    }
    return _rowTitleArray;
}

- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(20, 20, 30, 30);
        _backButton.backgroundColor = [UIColor redColor];
        [_backButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_backButton];
        [self.view bringSubviewToFront:_backButton];
    }
    return _backButton;
}
- (void)backClick:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
