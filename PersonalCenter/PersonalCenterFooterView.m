//
//  PersonalCenterFooterView.m
//  PersonalCenter
//
//  Created by colorPen on 16/1/11.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "PersonalCenterFooterView.h"

@interface PersonalCenterFooterView ()

@property (nonatomic , strong) UIButton * exitButton;

@property (nonatomic, copy) footerClickBlock footerBlock_t;

@end

@implementation PersonalCenterFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithRed:0.96 green:0.97 blue:0.97 alpha:1];

        CGFloat width  = self.bounds.size.width - 20;
        CGFloat height = self.bounds.size.height - 20;
        
        _exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _exitButton.frame = CGRectMake(10, 10, width, height);
        [_exitButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_exitButton setTitle:@"退出我的账号" forState:UIControlStateNormal];
        [_exitButton addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
        _exitButton.layer.borderColor = [UIColor redColor].CGColor;
        _exitButton.layer.borderWidth = 0.5f;
        _exitButton.layer.masksToBounds = YES;
        _exitButton.layer.cornerRadius = 10;
        [self addSubview:_exitButton];
    }
    return self;
}

- (void)exit
{
    if (self.footerBlock_t) {
        self.footerBlock_t();
    }
}

- (void)setFooterClick:(footerClickBlock)click
{
    self.footerBlock_t = [click copy];
}

@end
