//
//  IOS7ViewController.m
//
//  Created by guobingwei on 15-4-12.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#import "IOS7ViewController.h"

@interface IOS7ViewController ()

@end

@implementation IOS7ViewController
@synthesize leftBackButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = VIEW_CONTROLLER_BG_COLOR;
    
    NSDictionary * dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    leftBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBackButton.frame = CGRectMake(0, 0, 50, 44);
    leftBackButton.backgroundColor = [UIColor clearColor];
    [leftBackButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    leftBackButton.hidden = YES;
    
    UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 13, 11, 18)];
    leftImageView.image = [UIImage imageNamed:@"icon_left_back"];
    [leftBackButton addSubview:leftImageView];
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, 12,45, 20)];
    leftLabel.font = [UIFont fontWithName:NORMAL_FONT size:16];
    leftLabel.textColor = [UIColor whiteColor];
    leftLabel.backgroundColor = [UIColor clearColor];
    leftLabel.text = @"返回";
    leftLabel.textAlignment = NSTextAlignmentLeft;
    [leftBackButton addSubview:leftLabel];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:leftBackButton];
    [self.navigationItem setLeftBarButtonItem:backItem];
    
    self.view.backgroundColor = VIEW_CONTROLLER_BG_COLOR;
    if (isIOS7) {
        [self setNeedsStatusBarAppearanceUpdate];
    }
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;//UIRectEdgeAll
        //self.navigationController.navigationBar.translucent = NO;
    }
    
    if (isIOS7) {
        [self.navigationController.navigationBar setBarTintColor:NAV_BG_COLOR];
    }else{
        [self.navigationController.navigationBar setTintColor:NAV_BG_COLOR];
    }
}

- (void)backButtonAction
{
    
}

-(BOOL)shouldAurorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)shouldAutorotate {
    return YES;
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
