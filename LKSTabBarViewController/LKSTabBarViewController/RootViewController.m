//
//  RootViewController.m
//  LKSTabBarViewController
//
//  Created by guobingwei on 15/8/21.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#import "RootViewController.h"
#import "MessageViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    MessageViewController *message = [[MessageViewController alloc] init];
    
    UINavigationController *navigationController;
    navigationController =  [[UINavigationController alloc] initWithRootViewController:message];
    if (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_7_0) {
        [navigationController.navigationBar setBarTintColor:NAV_BG_COLOR];
    }else{
        [navigationController.navigationBar setTintColor:NAV_BG_COLOR];
    }
    navigationController.view.backgroundColor = [UIColor brownColor];
    
    [self.view addSubview:navigationController.view];
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
