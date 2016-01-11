//
//  PersonalCenterHeaderView.m
//  PersonalCenter
//
//  Created by colorPen on 16/1/11.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "PersonalCenterHeaderView.h"

static CGFloat const headerImageWidth = 80.0f;

@interface PersonalCenterHeaderView ()

@property (nonatomic, strong) UIImageView *headerView;
@property (nonatomic, copy) headerImageClickBlock headerBlock_t;

@end

@implementation PersonalCenterHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.96 green:0.97 blue:0.97 alpha:1];
        
        CGFloat rect_x = 0.5 * (self.bounds.size.width - headerImageWidth);
        CGFloat rect_y = 50;
        CGRect rect = CGRectMake(rect_x, rect_y, headerImageWidth, headerImageWidth);
        
        // 头像
        _headerView = [[UIImageView alloc]initWithFrame:rect];
        _headerView.userInteractionEnabled = YES;
        _headerView.layer.borderWidth = 2;
        _headerView.layer.borderColor = [UIColor whiteColor].CGColor;
        _headerView.layer.masksToBounds = YES;
        _headerView.layer.cornerRadius = 0.5 * headerImageWidth;
        [self addSubview:_headerView];
        
        // 点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headerViewClick:)];
        [_headerView addGestureRecognizer:tap];
    }
    return self;
}

// SDWebImage设置头像、点击回调
- (void)setHeaderImageView:(NSString *)url
{
    
}

- (void)setHeaderClick:(headerImageClickBlock)click
{
    self.headerBlock_t = [click copy];
}

- (void)headerViewClick:(UITapGestureRecognizer *)tap
{
    if (self.headerBlock_t) {
        self.headerBlock_t();
    }
}

@end
