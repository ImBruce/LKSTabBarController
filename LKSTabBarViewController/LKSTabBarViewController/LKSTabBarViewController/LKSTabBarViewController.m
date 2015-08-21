//
//  LKSTabBarViewController.m
//  LKSTabBarViewController
//
//  Created by guobingwei on 15/8/19.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#import "LKSTabBarViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "SearchViewController.h"
#import "ProfileViewController.h"
#import "LKSTabBarItem.h"

#define SELECTED_CONTROLLER_TAG 987654321

@interface LKSTabBarViewController ()

@property (nonatomic, strong) NSMutableArray *tabbarItemArray;

@end

@implementation LKSTabBarViewController

#pragma mark - 系统的方法 控制器的system methods

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
    
    if (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_7_0) {
        [self setNeedsStatusBarAppearanceUpdate];
    }
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;//UIRectEdgeAll
        //self.navigationController.navigationBar.translucent = NO;
    }
    [self initWithTabbar];
}

#pragma mark - tabbar的状态显示与创建方法

/**
 *  设置tabbar的状态：是否隐藏
 *
 *  @param tabbarShow 是否隐藏
 *  @param animated   隐藏与显示tabbar是否有动画
 */
- (void)setLKSTabbarStatus:(BOOL)tabbarShow animated:(BOOL)animated
{
    _tabbarHiden = tabbarShow;

    if (_lksTabBarStatuAnimateMode == LKSTabBarStatuAnimateModeNone) {
        if (tabbarShow) {
            _lksTabBar.hidden = NO;
        } else {
            if (animated) {
                [UIView animateWithDuration:0.25 animations:^{
                    _lksTabBar.hidden = YES;
                } completion:nil];
            } else {
                _lksTabBar.hidden = YES;
            }
        }
    } else if (_lksTabBarStatuAnimateMode == LKSTabBarStatuAnimateModeAlpha) {
        if (tabbarShow) {
            if (animated) {
                _lksTabBar.alpha = 0.0;
                [UIView animateWithDuration:0.25 animations:^{
                    _lksTabBar.alpha = 1.0;
                } completion:nil];
            } else {
                _lksTabBar.alpha = 1.0;
            }
        } else {
            if (animated) {
                _lksTabBar.alpha = 1.0;
                [UIView animateWithDuration:0.25 animations:^{
                    _lksTabBar.alpha = 0.0;
                } completion:nil];
            } else {
                _lksTabBar.alpha = 0.0;
            }
        }
    } else if (_lksTabBarStatuAnimateMode == LKSTabBarStatuAnimateModePosition) {
        if (tabbarShow) {
            if (animated) {
                _lksTabBar.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 48.0);
                [UIView animateWithDuration:0.25 animations:^{
                    _lksTabBar.frame = CGRectMake(0, ScreenHeight - 48.0, ScreenWidth, 48.0);
                } completion:nil];
            } else {
                _lksTabBar.frame = CGRectMake(0, ScreenHeight - 48.0, ScreenWidth, 48.0);
            }

        } else {
            if (animated) {
                _lksTabBar.frame = CGRectMake(0, ScreenHeight - 48.0, ScreenWidth, 48.0);
                [UIView animateWithDuration:0.25 animations:^{
                    _lksTabBar.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 48.0);
                } completion:nil];
            } else {
                _lksTabBar.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 48.0);
            }

        }
    }
}

/**
 *  初始化tabbar的基础数据
 */
- (void)initWithTabbar
{
    _selectedIndex = 0;
    _tabbarHiden = YES;
    _imageArray = [[NSArray alloc] initWithObjects:@"icon_home1",@"icon_alarm_center1",@"icon_persion_center1",@"icon_persion_center1",nil];
    _selectedImageArray = [[NSArray alloc] initWithObjects:@"icon_home2",@"icon_alarm_center2",@"icon_persion_center2",@"icon_persion_center2",nil];
    
    _textArray = [[NSArray alloc] initWithObjects:@"首页",@"消息",@"发现",@"我的",nil];

    [self viewLoadControllers];
    [self showLKSTabBar];
    [self switchTabbarControllers:_selectedIndex];
}

/**
 *  tabbar选中的是哪一个进行切换viewcontroller
 *
 *  @param index 哪个tabbar的item的下标
 */
- (void)lksSelectedTabbarViewController:(NSInteger)index
{
    if (index < 0 || index >= [[self viewControllers] count]) {
        return;
    }
    
    UIView *controllerView = [self.view viewWithTag:SELECTED_CONTROLLER_TAG];
    [controllerView removeFromSuperview];
    
    UIViewController *controller = [_viewControllers objectAtIndex:index];
    DLog(@"controlle : %@",controller);
    DLog(@"controlle view : %@",controller.view);
    
    DLog(@"controller.view x:%f,y:%f,width:%f,height:%f",controller.view.frame.origin.x,controller.view.frame.origin.y,controller.view.frame.size.width,controller.view.frame.size.height);
    controller.view.frame = CGRectMake(0,0,ScreenWidth, self.view.frame.size.height);
    controller.view.tag = SELECTED_CONTROLLER_TAG;
    DLog(@"self.controller.view x:%f,y:%f,width:%f,height:%f",controller.view.frame.origin.x,controller.view.frame.origin.y,controller.view.frame.size.width,controller.view.frame.size.height);
    [self.view insertSubview:controller.view belowSubview:_lksTabBar];
}

/**
 *  创建LKSTabBarItem的数组
 *
 *  @return items的元素数组
 */
- (NSArray *)lksTabBarItems
{
    NSMutableArray *tabbarArray = [[NSMutableArray alloc] init];
    
    CGFloat tabbarWidth = 0.0;
    if (_textArray && [_textArray count] > 0) {
        tabbarWidth = ScreenWidth/[_textArray count];
    }
    
    int count = 0;
    for (; count < [_textArray count]; count++) {
        
        LKSTabBarItem *lksTabItem = [[LKSTabBarItem alloc] init];
        lksTabItem.backGroundColor = NAV_BG_COLOR;
        lksTabItem.title = [_textArray objectAtIndex:count];
        lksTabItem.textColor = [UIColor blackColor];
        lksTabItem.selectedTextColor = [UIColor whiteColor];
        lksTabItem.textFont = [UIFont fontWithName:NORMAL_FONT size:12];
        lksTabItem.textRect = CGRectMake(0, 32, tabbarWidth, 20);
        lksTabItem.image = [UIImage imageNamed:[_imageArray objectAtIndex:count]];
        lksTabItem.selectedImage = [UIImage imageNamed:[_selectedImageArray objectAtIndex:count]];
        
        [tabbarArray addObject:lksTabItem];
    }
    
    return tabbarArray;
}

/**
 *  创建tabbar
 */
- (void)showLKSTabBar
{
    _lksTabBar = [[LKSTabBar alloc] init];
    _lksTabBar.delegate = self;
    _lksTabBar.items = [self lksTabBarItems];
    _lksTabBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_lksTabBar];
    
    [self switchTabbarControllers:_selectedIndex];
}

/**
 *  切换tabbar的选择控制器
 *
 *  @param index 下标
 */
- (void)switchTabbarControllers:(NSInteger)index
{
    _selectedIndex = index;
    _selectedViewController = [_viewControllers objectAtIndex:index];
    [self lksSelectedTabbarViewController:index];
}

/**
 *  初始化导航栏函数
 *
 *  @param controllerClass
 *
 *  @return UINavigationController 导航控制器对象
 */
- (UINavigationController *)navigationControllerFormController:(UIViewController *)controller
{
    UINavigationController *navigationController;
    navigationController =  [[UINavigationController alloc] initWithRootViewController:controller];
    if (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_7_0) {
        [navigationController.navigationBar setBarTintColor:NAV_BG_COLOR];
    }else{
        [navigationController.navigationBar setTintColor:NAV_BG_COLOR];
    }
    return navigationController;
}

/**
 *  载入显示的viewcontrollers
 */
- (void)viewLoadControllers
{
    
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    
    UINavigationController *navigationController = nil;
    //首页
    HomeViewController *homePage = [[HomeViewController alloc] init];
    navigationController = [self navigationControllerFormController:homePage];
    [controllers addObject:navigationController];
    navigationController = nil;
    
    //消息
    MessageViewController *message = [[MessageViewController alloc] init];
    navigationController = [self navigationControllerFormController:message];
    [controllers addObject:navigationController];
    navigationController = nil;
    
    //发现
    SearchViewController *search = [[SearchViewController alloc] init];
    navigationController = [self navigationControllerFormController:search];
    [controllers addObject:navigationController];
    navigationController = nil;
    
    //我的
    ProfileViewController *profile = [[ProfileViewController alloc] init];
    navigationController = [self navigationControllerFormController:profile];
    [controllers addObject:navigationController];
    navigationController = nil;
    
    //设置tabbar的容器
    [self setViewControllers:controllers];
}

/**
 *  设置viewcontrollers
 *
 *  @param viewControllers
 */
- (void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = viewControllers;
}

#pragma mark - tabbar的delegate代理方法

/**
 *  可以点击tabbar
 *
 *  @param tabBar
 *  @param index
 *
 *  @return 状态
 */
- (BOOL)lksTabBar:(LKSTabBar *)tabBar shouldSelectItemAtIndex:(NSInteger)index
{
    return YES;
}

/**
 *  tabbar选中
 *
 *  @param tabBar
 *  @param index
 */
- (void)lksTabBar:(LKSTabBar *)tabBar didSelectItemAtIndex:(NSInteger)index
{
    if (index < 0 || index >= [[self viewControllers] count]) {
        return;
    }
    
    [self lksSelectedTabbarViewController:index];
}

#pragma mark - 设置显示状态栏等 控制器的system methods

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

- (void)dealloc
{
    self.textArray = nil;
    self.imageArray = nil;
    self.selectedImageArray = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
