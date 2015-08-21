//
//  LKSTabBarItem.h
//  LKSTabBarViewController
//
//  Created by guobingwei on 15/8/19.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKSTabBarItem : UIControl

/**
 *  tabbarItem的背景颜色
 */
@property (nonatomic, strong) UIColor *backGroundColor;

/**
 *  tabbarItem的背景图
 */
@property (nonatomic, strong) UIColor *backGroundImage;

/**
 *  tabbar显示的图片
 */
@property (nonatomic, strong) UIImage *image;

/**
 *  tabbar显示的点击的图片
 */
@property (nonatomic, strong) UIImage *selectedImage;

/**
 *  tabbar显示的标题title
 */
@property (nonatomic, strong) NSString *title;

/**
 *  tabbar显示的标题的title的颜色
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 *  tabbar显示的标题的title选中时候的颜色
 */
@property (nonatomic, strong) UIColor *selectedTextColor;

/**
 *  tabbar显示的标题的title的字体
 */
@property (nonatomic, strong) UIFont *textFont;

/**
 *  设置tabbar显示的title的控件大小
 */
@property (nonatomic) CGRect textRect;

/**
 *  设置标题的颜色
 *
 *  @param textColor
 */
- (void)setTextColor:(UIColor *)textColor;

/**
 *  设置标题选中时的标题颜色
 *
 *  @param selectedTextColor
 */
- (void)setSelectedTextColor:(UIColor *)selectedTextColor;

@end
