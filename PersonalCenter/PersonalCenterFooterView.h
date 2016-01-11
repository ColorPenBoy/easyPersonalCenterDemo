//
//  PersonalCenterFooterView.h
//  PersonalCenter
//
//  Created by colorPen on 16/1/11.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^footerClickBlock)();

@interface PersonalCenterFooterView : UIView

// 点击退出回调
- (void)setFooterClick:(footerClickBlock)click;

@end
