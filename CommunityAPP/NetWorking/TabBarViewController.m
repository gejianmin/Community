//
//  BBSTabBarViewController.m
//  55BBS
//
//  Created by KepenJ on 2017/3/2.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "TabBarViewController.h"
#import "InformationViewController.h"
#import "InteractionViewController.h"
#import "PublicCircleController.h"
#import "QuarterViewController.h"
#import "MineViewController.h"
#import "NavigationViewController.h"

@interface TabBarViewController ()<UITabBarControllerDelegate>

@property (nonatomic,copy) NSArray *btnArray;
@end

@implementation TabBarViewController

- (instancetype)init{
    if (self = [super init]) {
        
        self.delegate = self;
        
        InformationViewController *forumVC = [[InformationViewController alloc] init];
        NavigationViewController *forumNV = [[NavigationViewController alloc] initWithRootViewController:forumVC];
        UIImage *forumVCNormalImage = [[UIImage imageNamed:@"tabbar_nor_0"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *forumVCSelectImage = [[UIImage imageNamed:@"tabbar_sel_0"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [forumVC.tabBarItem setImage:forumVCNormalImage];
        [forumVC.tabBarItem setSelectedImage:forumVCSelectImage];
        forumVC.tabBarItem.title = @"资讯";
        [forumVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateNormal];
        [forumVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
        
        //    [forumNV.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
        
        QuarterViewController *carefullyChioceVC = [[QuarterViewController alloc] init];
        NavigationViewController *carefullyChioceNV = [[NavigationViewController alloc] initWithRootViewController:carefullyChioceVC];
        UIImage *carefullyChioceNormalImage = [[UIImage imageNamed:@"tabbar_nor_1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *carefullyChioceSelectImage = [[UIImage imageNamed:@"tabbar_sel_1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [carefullyChioceVC.tabBarItem setImage:carefullyChioceNormalImage];
        [carefullyChioceVC.tabBarItem setSelectedImage:carefullyChioceSelectImage];
        carefullyChioceVC.tabBarItem.title = @"一刻钟";
        [carefullyChioceVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateNormal];
        [carefullyChioceVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
        
        InteractionViewController *informationVC = [[InteractionViewController alloc] init];
        NavigationViewController *informationNV = [[NavigationViewController alloc] initWithRootViewController:informationVC];
        UIImage *informationNormalImage = [[UIImage imageNamed:@"tabbar_nor_2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *informationSelectImage = [[UIImage imageNamed:@"tabbar_sel_2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [informationVC.tabBarItem setImage:informationNormalImage];
        [informationVC.tabBarItem setSelectedImage:informationSelectImage];
        informationVC.tabBarItem.title = @"互动";
        [informationVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateNormal];
        [informationVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
        
        PublicCircleController *findVC = [[PublicCircleController alloc] init];
        NavigationViewController *findNV = [[NavigationViewController alloc] initWithRootViewController:findVC];
        UIImage *findVCNormalImage = [[UIImage imageNamed:@"tabbar_nor_3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *findVCSelectImage = [[UIImage imageNamed:@"tabbar_sel_3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [findVC.tabBarItem setImage:findVCNormalImage];
        [findVC.tabBarItem setSelectedImage:findVCSelectImage];
        findVC.tabBarItem.title = @"公共圈";
        [findVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateNormal];
        [findVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
        
        MineViewController *mineVC = [[MineViewController alloc] init];
        NavigationViewController *mineNV = [[NavigationViewController alloc] initWithRootViewController:mineVC];
        UIImage *mineVCNormalImage = [[UIImage imageNamed:@"tabbar_nor_4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *mineVCSelectImage = [[UIImage imageNamed:@"tabbar_sel_4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [mineVC.tabBarItem setImage:mineVCNormalImage];
        [mineVC.tabBarItem setSelectedImage:mineVCSelectImage];
        mineVC.tabBarItem.title = @"我的";
        [mineVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateNormal];
        [mineVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
        
        [self setViewControllers:@[forumNV,carefullyChioceNV,informationNV,findNV,mineNV]];
        
        self.selectedIndex = 0;
        [UITabBar appearance].translucent = NO;
        [UINavigationBar appearance].translucent = NO;
        [[UINavigationBar appearance]setBarTintColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


//    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    
}
#pragma mark -- StatusBar
//- (BOOL)prefersStatusBarHidden {
//    return NO;
//}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if (!self.btnArray) {
        self.btnArray = [tabBarController.tabBar subviews];
    }
    NSLog(@"selectedIndex = %ld",self.selectedIndex);
    NSLog(@"%@",self.btnArray);
    [self scaleAnimate:[self.btnArray objectAtIndex:self.selectedIndex + 1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scaleAnimate:(UIView *)bar{
    CAKeyframeAnimation *animation = [[CAKeyframeAnimation alloc] init];
    animation.values = @[@1.0, @0.95, @0.9, @0.85, @0.8, @0.85, @0.9, @0.95, @1.0, @1.05, @1.1, @1.05, @1.0];
    animation.duration = 0.3;
    animation.calculationMode = kCAAnimationCubic;
    
    [bar.layer addAnimation:animation forKey:@"transform.scale"];
}
@end
