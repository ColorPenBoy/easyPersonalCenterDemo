//
//  PersonalCenterCell.m
//  PersonalCenter
//
//  Created by colorPen on 16/1/11.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "PersonalCenterCell.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

typedef NS_ENUM(NSInteger , CornerType) {
    CornerType_All = 0, // 四个角
    CornerType_Top,     // 上半部分
    CornerType_Bottom   // 下半部分
};

// 箭头图片名字
static NSString * const RightArrowImageName = @"";
// cell两侧空白间距
static CGFloat const LocationCellSpace = 15.0f;

@interface PersonalCenterCell ()

// 左侧标题
@property (nonatomic, strong) UILabel * titleLabel;
// 右侧箭头
@property (nonatomic, strong) UIImageView * rightArrow;
// 下部分割线
@property (nonatomic, strong) UIView * bottomLine;

@end

@implementation PersonalCenterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self titleLabel];
        [self rightArrow];
        [self bottomLine];
    }
    return self;
}


- (void)loadPersonalCenterCellWithTitleArray:(NSArray *)titleArray indexPath:(NSIndexPath *)indexPath;
{
    // 底部分割线hidden
    self.bottomLine.hidden = (indexPath.row == [titleArray[indexPath.section] count] - 1) ? YES : NO;
    // 左侧标题
    self.titleLabel.text = titleArray[indexPath.section][indexPath.row];
    
    static int j = 0;
    // 上部切圆角
    if (indexPath.row == 0) {
        NSLog(@"%@",@(j++));
        [self makeCornerRadiusForType:CornerType_Top];
    }
    // 底部切圆角
    if (indexPath.row == [titleArray[indexPath.section] count] - 1) {
        [self makeCornerRadiusForType:CornerType_Bottom];
    }
    // 四角
    if ([titleArray[indexPath.section] count] == 1) {
        [self makeCornerRadiusForType:CornerType_All];
    }
}


- (void)layoutSubviews
{
    CGFloat cellHeight = self.contentView.bounds.size.height;
    CGFloat cellWidth  = self.contentView.bounds.size.width;
    
    self.titleLabel.frame = CGRectMake(10, 15, 200, 20);
    self.rightArrow.frame = CGRectMake(cellWidth - 30, 15, 20, 20);
    self.bottomLine.frame = CGRectMake(10, cellHeight - 0.5, cellWidth - 20, 0.5);
}

#pragma mark - Lazy load
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}
- (UIImageView *)rightArrow
{
    if (!_rightArrow) {
        _rightArrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:RightArrowImageName]];
        _rightArrow.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_rightArrow];
    }
    return _rightArrow;
}
- (UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc]init];
        _bottomLine.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_bottomLine];
    }
    return _bottomLine;
}

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

// Cell两边留出空白，需重写此函数
- (void)setFrame:(CGRect)frame
{
    frame.origin.x += LocationCellSpace;
    frame.size.width -= 2 * LocationCellSpace;
    [super setFrame:frame];
}

// 上、下切圆角
- (void)makeCornerRadiusForType:(CornerType)type
{
    // 类型
    UIRectCorner rectCorner;
    switch (type)
    {
        case CornerType_Top:
            rectCorner = UIRectCornerTopLeft | UIRectCornerTopRight;
            break;
        case CornerType_Bottom:
            rectCorner = UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        default:
            rectCorner = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
    }
    
    // 圆角
    CGSize cornerSize = CGSizeMake(10, 10);
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:rectCorner
                                                         cornerRadii:cornerSize];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
@end
