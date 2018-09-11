//
//  GSAGloabConfig.h
//  GreenShoesActionClient
//
//  Created by 赵东 on 2018/4/9.
//  Copyright © 2018年 赵东. All rights reserved.
//

#ifndef GSAGloabConfig_h
#define GSAGloabConfig_h

#define App ((AppDelegate*)[UIApplication sharedApplication].delegate)

#define HH_REGISTER_VALID //验证开关，注释掉就是不验证

#define kTabbarH 50
#define GSACountDownGeneralValue 60

/*!< 弱引用 */
#define JTDWeakSelf __weak typeof(self) WeakSelf = self;
//log日志打印,包含该函数名,行数
#if DEBUG
#define HHLog(id, ...) NSLog((@"%s [Line %d] " id),__PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define HHLog(id, ...)
#endif

//定义UIImage对象
#define ImageNamed(s) [UIImage imageNamed:s]

#define GSAPlaceholderImageBG ImageNamed(@"test")
#define GSAPlaceholderImageIcon ImageNamed(@"UC_info")
/*!< 默认背景图片*/
#define GSADefaultImage @"test1"
static NSString * const PSDefaultIconImage = @"icon_top_bg";/*!< icon默认图*/
/*!< 默认头像*/
#define defaultHeadImage [UIImage imageNamed:@"defaultHeadImage"]

//屏幕的高度
#define HH_SCREEN_H [UIScreen mainScreen].bounds.size.height
//屏幕的宽带
#define HH_SCREEN_W [UIScreen mainScreen].bounds.size.width
//状态栏的高度
#define kStatusHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?44:20)
#define kTabBarStatusHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)
//3.5英寸屏幕
#define HH_SCREEN_3_5 ([UIScreen mainScreen].bounds.size.height==480.f)

//4.0英寸屏幕
#define HH_SCREEN_4_0 ([UIScreen mainScreen].bounds.size.height==568.f)

//4.7英寸屏幕
#define HH_SCREEN_4_7 ([UIScreen mainScreen].bounds.size.height==667.f)

//5.5英寸屏幕
#define HH_SCREEN_5_5 ([UIScreen mainScreen].bounds.size.height==736.f)

/*!< 5.8英寸屏幕*/

#define GSA_SCREEN_5_8 ([UIScreen mainScreen].bounds.size.height==812.f)

/*!< 距导航栏顶部高度*/

#define GSANavHeight  (GSA_SCREEN_5_8 ? 88.0f : 64.0f)

/*!< 导航栏高度*/

#define GSANavgationBarHeight  (GSA_SCREEN_5_8 ? 68.0f : 44.0f)

/*!< Tabbar高度*/
#define GSA_TabbarHeight  (GSA_SCREEN_5_8 ? 83.f : 49.f)

//获取用户frame
#define Frame(x,y,w,h) CGRectMake(x, y, w, h)

// 版本
#define GSA_IOS_7 ([HHSystemInfo sharedInstance].iosVersion < 8.0 && [HHSystemInfo sharedInstance].iosVersion >= 7.0)
#define GSA_IOS_8 ([HHSystemInfo sharedInstance].iosVersion < 9.0 && [HHSystemInfo sharedInstance].iosVersion >= 8.0)
#define GSA_IOS_9 ([HHSystemInfo sharedInstance].iosVersion < 10.0 && [HHSystemInfo sharedInstance].iosVersion >= 9.0)
#define GSA_IOS_10 ([HHSystemInfo sharedInstance].iosVersion < 11.0 && [HHSystemInfo sharedInstance].iosVersion >= 10.0)

#define GSA_IOS_7_L ([HHSystemInfo sharedInstance].iosVersion >= 7.0)
#define GSA_IOS_8_L ([HHSystemInfo sharedInstance].iosVersion >= 8.0)
#define GSA_IOS_9_L ([HHSystemInfo sharedInstance].iosVersion >= 9.0)
#define GSA_IOS_10_L ([HHSystemInfo sharedInstance].iosVersion >= 10.0)
#define GSA_IOS_11_L ([HHSystemInfo sharedInstance].iosVersion >= 11.0)

#define GSAWidthScale (((AppDelegate *)[UIApplication sharedApplication].delegate).sizeScaleX)

#define GSAHeightScale (((AppDelegate *)[UIApplication sharedApplication].delegate).sizeScaleY)

#define Width(v)                CGRectGetWidth((v).frame)
#define Height(v)               CGRectGetHeight((v).frame)
/*!< 是不是空字符串*/
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil||[str isEqualToString:@"(null)"] ||[str length] < 1 ? YES : NO )
/*!< 是不是空数组*/
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
/*!< 是不是空字典*/
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
/*!< 是不是空对象*/
#define kObjectIsEmpty(_object) (_object == nil||[_object isKindOfClass:[NSNull class]]|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0)|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

/*!< 友盟分享*/
#define USHARE_APPKEY @"5b9381ccb27b0a22830005c6"
static NSString * kUMengShareNotification = @"kUMengShareNotification";
/*!< code码*/
#define successCode @"success"
#define failedCode @"failed"
#define ACCESSTOKEN @"ACCESSTOKEN"





#endif /* GSAGloabConfig_h */
