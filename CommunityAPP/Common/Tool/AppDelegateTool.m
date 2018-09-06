//
//  APPDelegateTool.m
//  CommunityAPP
//
//  Created by yingke on 2018/7/10.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "APPDelegateTool.h"

@implementation AppDelegateTool


+ (UIViewController *)currentViewController
{
    return [self topViewController];
}

+ (UIViewController *)topViewController
{
    UIViewController *target = nil;
    
    target = [self topViewController:[[[[UIApplication sharedApplication] delegate] window] rootViewController]];
    
    if (!target) {
        return  nil;
    }
    
    while (target.presentedViewController) {
        target = [self topViewController:target.presentedViewController];
    }
    
    return target;
}

+ (UIViewController *)topViewController:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UINavigationController class]])
    {
        return [self topViewController:[(UINavigationController *)vc topViewController]];
    }
    else if ([vc isKindOfClass:[UITabBarController class]])
    {
        return [self topViewController:[(UITabBarController *)vc selectedViewController]];
    }
    else {
        return vc;
    }
    
    return nil;
}
@end
