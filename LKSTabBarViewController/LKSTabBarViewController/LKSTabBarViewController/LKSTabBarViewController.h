//
//  LKSTabBarViewController.h
//  LKSTabBarViewController
//
//  Created by guobingwei on 15/8/19.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonDefination.h"
#import "LKSTabBar.h"

typedef NS_ENUM(NSInteger, LKSTabBarStatuAnimateMode) {
    LKSTabBarStatuAnimateModeNone  = 0,
    LKSTabBarStatuAnimateModeAlpha  = 1 << 0,
    LKSTabBarStatuAnimateModePosition  = 1 << 1,
};

@class LKSTabBarItem;

@protocol LKSTabBarViewControllerDelegate <NSObject>


@end

@interface LKSTabBarViewController : UIViewController<LKSTabBarDelegate>

/**
 *  动画显示的三种模式，默认，透明度，位置
 */
@property (nonatomic) LKSTabBarStatuAnimateMode lksTabBarStatuAnimateMode;

/**
 *  LKSTabBarViewControllerDelegate协议
 */
@property (nonatomic, weak) id<LKSTabBarViewControllerDelegate>delegate;

/**
 *  tabbar的viewControllers
 */
@property (nonatomic, copy) NSArray *viewControllers;

/**
 *  tabbar上显示的文本内容
 */
@property (nonatomic, strong) NSArray *textArray;

/**
 *  图片数组集合
 */
@property (nonatomic, strong) NSArray *imageArray;

/**
 *  设置选中的图片数组
 */
@property (nonatomic, strong) NSArray *selectedImageArray;

/**
 *  选中的时的viewcontroller
 */
@property (nonatomic, weak) UIViewController *selectedViewController;

/**
 *  tabbar显示的view
 */
@property (nonatomic, strong) LKSTabBar *lksTabBar;

/**
 *  选中的tabbar的index
 */
@property (nonatomic, assign) NSInteger selectedIndex;

/**
 *  tabbar的隐藏状态
 */
@property (nonatomic, assign) BOOL tabbarHiden;

/**
 *  初始化tabbar的基础数据
 */
- (void)initWithTabbar;

/**
 *  初始化导航栏函数
 *
 *  @param controllerClass
 *
 *  @return UINavigationController 导航控制器对象
 */
- (UINavigationController *)navigationControllerFormController:(UIViewController *)controller;

/**
 *  设置tabbar的状态：是否隐藏
 *
 *  @param tabbarShow 是否隐藏
 *  @param animated   隐藏与显示tabbar是否有动画
 */
- (void)setLKSTabbarStatus:(BOOL)tabbarShow animated:(BOOL)animated;

/**
 *  切换tabbar的选择控制器
 *
 *  @param index 下标
 */
- (void)switchTabbarControllers:(NSInteger)index;

/**
 *  创建tabbar
 */
- (void)showLKSTabBar;

@end
