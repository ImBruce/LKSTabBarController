//
//  MessageViewController.m
//  LKSTabBarViewController
//
//  Created by guobingwei on 15/8/19.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#import "MessageViewController.h"
#import "DetailViewController.h"
#import  <QuartzCore/CoreAnimation.h>
#import "AppDelegate.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = BLUE_COLOR;
    
    self.title = @"消息";

    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [testBtn setFrame:CGRectMake(0, 100, 100, 50)];
    testBtn.backgroundColor = [UIColor greenColor];
    [testBtn addTarget:self action:@selector(testBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
}

- (void)testBtnAction
{
    [KAppDelegate.lksTabBar setLKSTabbarStatus:NO animated:YES];
    [self.navigationController pushViewController:[DetailViewController new] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
