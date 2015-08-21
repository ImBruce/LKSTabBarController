//
//  ViewController.m
//  LKSTabBarViewController
//
//  Created by guobingwei on 15/8/19.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#import "ViewController.h"
#import "LKSTabBarItem.h"
#import "LKSTabBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LKSTabBarItem *lksTabItem = [[LKSTabBarItem alloc] initWithFrame:CGRectMake(10, 50, 100, 50)];
    lksTabItem.backGroundColor = [UIColor lightGrayColor];
    lksTabItem.title = @"测试代码";
    lksTabItem.textColor = [UIColor whiteColor];
    lksTabItem.textFont = [UIFont systemFontOfSize:14];
    lksTabItem.textRect = CGRectMake(0, 30, self.view.frame.size.width/2, 20);
    lksTabItem.image = [UIImage imageNamed:@"third_normal"];
    lksTabItem.selectedImage = [UIImage imageNamed:@"third_selected"];
    
    LKSTabBarItem *lksTabItem2 = [[LKSTabBarItem alloc] initWithFrame:CGRectMake(10, 50, 100, 50)];
    lksTabItem2.backGroundColor = [UIColor lightGrayColor];
    lksTabItem2.title = @"测试代码2";
    lksTabItem2.textColor = [UIColor whiteColor];
    lksTabItem2.textFont = [UIFont systemFontOfSize:14];
    lksTabItem2.textRect = CGRectMake(0, 30, self.view.frame.size.width/2, 20);
    lksTabItem2.image = [UIImage imageNamed:@"third_normal"];
    lksTabItem2.selectedImage = [UIImage imageNamed:@"third_selected"];
    
    LKSTabBar *tabbarView = [[LKSTabBar alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 48)];
    tabbarView.items = [NSArray arrayWithObjects:lksTabItem,lksTabItem2, nil];
    tabbarView.indicatorPosition = UIIndicatorPositionTop;
    [self.view addSubview:tabbarView];
    //[self.view addSubview:lksTabItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
