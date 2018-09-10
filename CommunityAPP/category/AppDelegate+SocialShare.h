//
//  AppDelegate+SocialShare.h
//  SwishChargeClient
//
//  Created by tongda ju on 2017/11/7.
//  Copyright © 2017年 JianMin Ge. All rights reserved.
//

#import "AppDelegate.h"
//#import <UMSocialCore/UMSocialCore.h>

//typedef void(^JTDSocialshareBlock)(id);

@interface AppDelegate (SocialShare)

//@property (nonatomic,copy) JTDSocialshareBlock block;//
//@property (nonatomic,copy) JTDSocialshareBlock successBlock;//
//@property (nonatomic,copy) JTDSocialshareBlock cancelBlock;//
//@property (nonatomic,copy) JTDSocialshareBlock failedblock;//

- (void)setupUMSDK;


#if __IPHONE_OS_VERSION_MAX_ALLOWED > 100000
- (BOOL)um_application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;
#endif
- (BOOL)um_application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
- (BOOL)um_application:(UIApplication *)application handleOpenURL:(NSURL *)url;
@end
