//
//  AppDelegate.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/1.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "RegisterRequest.h"
#import "LoginRequest.h"
#import "LoginViewController.h"
#import "NearCommunityController.h"
#import "GuidePagesViewController.h"
#import "UserObjModel.h"
#import "NavigationViewController.h"
#import "AppDelegate+SocialShare.h"

@interface AppDelegate ()
    
@end

@implementation AppDelegate
    
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectMainWindow:) name:SelectMainWindow object:nil];
    
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    [self selectMainWindow:nil];/** 初始化视图*/
    [self setupUMSDK];/*!< 友盟分享*/
    return YES;
}
- (void)selectMainWindow:(NSNotification *)notify{
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    BOOL isFirstLoginAPP = [userDef objectForKey:@"notFirst"];
    if (!isFirstLoginAPP) {
        [self goToGuidePage];
    }else if (kStringIsEmpty([[HHClient sharedInstance] user].org_id)){/**未选择社区*/
        [self goToNearCommunity];
    }else if (!kStringIsEmpty([[HHClient sharedInstance] user].org_id)) {/**已选择社区*/
        NSLog(@"%@",[[HHClient sharedInstance] user].org_id);
        [self gotoMainWindow];
    }else{
        
    }
}
// 引导页
- (void)goToGuidePage {
    GuidePagesViewController *gpvc = [[GuidePagesViewController alloc]init];
    self.window.rootViewController = gpvc;
    [self.window resignKeyWindow];
}
- (void)goToNearCommunity{
    NearCommunityController *tabVC = [[NearCommunityController alloc] init];
    NavigationViewController *navi = [[NavigationViewController alloc]initWithRootViewController:tabVC];
    navi.navigationBar.hidden = YES;
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
}
- (void)goToLogin{
    LoginViewController *tabVC = [[LoginViewController alloc] init];
    NavigationViewController *navi = [[NavigationViewController alloc]initWithRootViewController:tabVC];
    navi.navigationBar.hidden = YES;
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
}
- (void)gotoMainWindow{
    TabBarViewController *tabVC = [[TabBarViewController alloc] init];
    self.window.rootViewController = tabVC;
    [self.window resignKeyWindow];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
    
    
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
    
    
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
    
    
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
    
    
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    
    [self um_application:app openURL:url options:options];
    
    return YES;
}
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    [self um_application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
    
    return YES;
}
    
@end
