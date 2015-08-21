//
//  LKSTabBarItem.m
//  LKSTabBarViewController
//
//  Created by guobingwei on 15/8/19.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#import "LKSTabBarItem.h"

@implementation LKSTabBarItem

/**
 *  初始化方法
 *
 *  @param frame
 *
 *  @return id 对象
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
}

/**
 *  初始化方法
 *
 *  @param aDecoder
 *
 *  @return id 对象
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

/**
 *  初始化方法
 *
 *  @return id 对象
 */
- (id)init
{
    return [self initWithFrame:CGRectZero];
}

/**
 *  绘制标题与显示的图标
 *
 *  @param rect
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIImage *iconImage;
    if (self.selected) {
        iconImage = _image;
    } else {
        iconImage = _selectedImage;
    }
    
    //绘制图标
    [iconImage drawInRect:CGRectMake((self.frame.size.width - iconImage.size.width)/2, 3, iconImage.size.width, iconImage.size.height)];
    
    //绘制标题
    CGContextSetLineWidth(context, 1.0);
    CGContextSetRGBFillColor (context, 78, 198, 109, 1.0);
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        [_title drawInRect:_textRect withFont:_textFont lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
    } else {
        [_title drawInRect:_textRect withFont:_textFont];
    }
}

#pragma mark - 设置item的基本信息

/**
 *  设置item的背景颜色
 *
 *  @param backGroundColor
 */
- (void)setBackGroundColor:(UIColor *)backGroundColor
{
    self.backgroundColor = backGroundColor;
}

/**
 *  设置标题的颜色及选中时的标题颜色
 *
 *  @param textColor
 */
- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
}

/**
 *  设置标题选中时的标题颜色
 *
 *  @param selectedTextColor
 */
- (void)setSelectedTextColor:(UIColor *)selectedTextColor
{
    _selectedTextColor = selectedTextColor;
}


@end
