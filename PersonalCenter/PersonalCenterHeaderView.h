//
//  PersonalCenterHeaderView.h
//  PersonalCenter
//
//  Created by colorPen on 16/1/11.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^headerImageClickBlock)();

@interface PersonalCenterHeaderView : UIView

// 设置头像
- (void)setHeaderImageView:(NSString *)url;
// 点击头像回调
- (void)setHeaderClick:(headerImageClickBlock)click;

@end
