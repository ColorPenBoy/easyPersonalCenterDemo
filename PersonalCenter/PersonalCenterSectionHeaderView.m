//
//  PersonalCenterSectionHeaderView.m
//  PersonalCenter
//
//  Created by colorPen on 16/1/11.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "PersonalCenterSectionHeaderView.h"

@implementation PersonalCenterSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGRect rect = CGRectMake(20, 10, 100, 20);
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:rect];
        titleLabel.text = title;
        titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:titleLabel];
    }
    return self;
}

@end
