//
//  AppDelegate+SocialShare.m
//  SwishChargeClient
//
//  Created by tongda ju on 2017/11/7.
//  Copyright © 2017年 JianMin Ge. All rights reserved.
//

#import "AppDelegate+SocialShare.h"
#import <UShareUI/UShareUI.h>
#import <UMCommon/UMCommon.h>

#define QQAPP_ID @"1106389887"
#define QQAPP_KEY @"wVcD6m1sbGzAqiuT"
#define WECHATAPP_ID @"wx0b0a05160fd4a3b0"
#define WECHATAPP_KEY @"0d5cf11f99f5f0c0a564eab198f5a615"

@implementation AppDelegate (SocialShare)

- (void)setupUMSDK{
    
    [[UMSocialManager defaultManager] openLog:YES];
    [[UMSocialManager defaultManager] setUmSocialAppkey:USHARE_APPKEY];
    [UMSocialGlobal shareInstance].isClearCacheWhenGetUserInfo = YES;/*!< 登录授权是否清缓存*/
     [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQAPP_ID appSecret:QQAPP_KEY redirectURL:nil];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:[AppDelegate getweChatAPPID] appSecret:WECHATAPP_KEY redirectURL:nil];
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:SinaAPP_Key appSecret:SinaAPP_Secret redirectURL:@"https://api.weibo.com/oauth2/default.html"];
    /*!< 友盟数据统计*/
    //    [UMConfigure initWithAppkey:USHARE_APPKEY channel:@"App Store"];
    //    [MobClick setScenarioType:E_UM_NORMAL];
    //    [UMConfigure setLogEnabled:YES];
    
}
//#define __IPHONE_10_0    100000
#if __IPHONE_OS_VERSION_MAX_ALLOWED > 100000
- (BOOL)um_application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
            BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
            return result;
    }
    return result;
}

#endif

- (BOOL)um_application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

- (BOOL)um_application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

@end
