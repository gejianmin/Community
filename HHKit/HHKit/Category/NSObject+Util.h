//
//  NSObject+Util.h
//  HuanYouWang
//
//  Created by liuwenjie on 15/5/15.
//  Copyright (c) 2015年 cc.huanyouwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Util)


/**
 延时做一件事

 @param timer 延时几秒
 @param task task
 */
-(void)delay:(NSTimeInterval)timer task:(dispatch_block_t) task;


/**
 快速归档

 @param aCoder aCoder
 */
- (void)fastEncode:(NSCoder *)aCoder;

/**
 快速接档

 @param aDecoder aDecoder
 */
- (void)fastDecode:(NSCoder *)aDecoder;

/**
 *  模型转字典 该方法未实现
 *
 *  @return 字典
 */
- (NSDictionary *)dictionaryFromModel;

/**
 字符串是否为空
 */
+(BOOL)isBlankString:(NSString *)string;

#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber;

#pragma 获取微信APPID
+ (NSString *)getweChatAPPID;
/**
 当前时间与自定义时间比较
 
 @param futureDay 自定义时间
 @return BOOL
 */
-(NSInteger )compareWithFutureDay:(NSString *)futureDay;

@end
