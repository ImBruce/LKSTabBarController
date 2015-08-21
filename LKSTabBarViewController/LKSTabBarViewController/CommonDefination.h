//
//  CommonDefination.h
//  laikeren
//
//  Created by guobingwei on 15/4/12.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#ifndef laikeren_CommonDefination_h
#define laikeren_CommonDefination_h

//常用颜色值
#define VIEW_CONTROLLER_BG_COLOR [UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1.0]
#define BORDER_COLOR [UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1.0]
#define BLACK_COLOR [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]
#define GRAY_COLOR [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]
#define LIGHT_GRAY_COLOR [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0]
#define ORANGE_COLOR [UIColor colorWithRed:251.0/255.0 green:150.0/255.0 blue:110.0/255.0 alpha:1.0]
#define RED_COLOR [UIColor colorWithRed:209.0/255.0 green:46.0/255.0 blue:42.0/255.0 alpha:1.0]
#define BLUE_COLOR [UIColor colorWithRed:60.0/255.0 green:141.0/255.0 blue:188.0/255.0 alpha:1.0]

#define PURPLE_COLOR [UIColor colorWithRed:230.0/255.0 green:130.0/255.0 blue:250.0/255.0 alpha:1.0]
#define DARK_BLUE_COLOR [UIColor colorWithRed:36.0/255.0 green:143.0/255.0 blue:169.0/255.0 alpha:1.0]
#define BTN_DARK_BLUE_COLOR [UIColor colorWithRed:36.0/255.0 green:143.0/255.0 blue:199.0/255.0 alpha:1.0]
#define BTN_LIGHT_GRAY_COLOR [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1.0]

#define TAB_BAR_COLOR [UIColor colorWithRed:242.0/255.0 green:245.0/255.0 blue:250.0/255.0 alpha:1.0]

#define NAV_BG_COLOR [UIColor colorWithRed:251.0/255.0 green:30.0/255.0 blue:57.0/255.0 alpha:1.0]

#define COLOR(a,b,c,d) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:d]

//判断系统版本
#define isIOS6 ([[[UIDevice currentDevice] systemVersion] floatValue] >=6.0 ? YES : NO)
#define isIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? YES : NO)
#define isIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0 ? YES : NO)

//屏幕宽度和高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

//偏移量
#define OffsetHeight ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? 20 : 0)

//Appdelegate宏定义
#define KAppDelegate ((AppDelegate *)([UIApplication sharedApplication].delegate))

//宏定义字体
#define NORMAL_FONT @"Helvetica-Light"
#define FONT_BOLD @"Helvetica-Bold"

//打印日志
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#endif
