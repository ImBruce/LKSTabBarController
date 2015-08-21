//
//  LKSTabBar.h
//  LKSTabBarViewController
//
//  Created by guobingwei on 15/8/19.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIIndicatorPosition) {
    UIIndicatorPositionTop  = 0,
    UIIndicatorPositionBottom  = 1,
};

@class LKSTabBarItem;
@class LKSTabBar;

@protocol LKSTabBarDelegate <NSObject>

/**
 *  tabbar将要选中
 *
 *  @param tabBar
 *  @param index
 *
 *  @return
 */
- (BOOL)lksTabBar:(LKSTabBar *)tabBar shouldSelectItemAtIndex:(NSInteger)index;

/**
 *  tabbar选中
 *
 *  @param tabBar
 *  @param index
 */
- (void)lksTabBar:(LKSTabBar *)tabBar didSelectItemAtIndex:(NSInteger)index;

@end

@interface LKSTabBar : UIView

/**
 *  协议delegate
 */
@property (nonatomic, weak) id<LKSTabBarDelegate>delegate;

/**
 *  上下指示条的位置
 */
@property (nonatomic) UIIndicatorPosition indicatorPosition;

/**
 *  tabbar的item数组
 */
@property (nonatomic, copy) NSArray *items;

/**
 *  选中的tabbar的Item
 */
@property (nonatomic, weak) LKSTabBarItem *selectedTabBarItem;

@property (nonatomic, strong) UIView *backGroundView;

@property (nonatomic, strong) UIImage *topIndicatorImage;

@property (nonatomic, strong) UIImage *bottomIndicatorImage;

@property (nonatomic, assign) CGFloat indicatorHeight;

@property (nonatomic, assign) CGFloat tabBarHeight;

- (void)switchTabbarItem:(NSInteger)index;

@end
