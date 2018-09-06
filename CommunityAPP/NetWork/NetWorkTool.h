//
//  NetWorkTool.h
//  55BBS
//
//  Created by KepenJ on 2017/2/24.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkTool : NSObject

/**
 *获取app版本号
 *
 * @return 返回版本号
 */
+ (NSString *)appVersion;

/**
 *获取app版本号
 *
 *@return 返回版本号
 */
+ (NSString *)bundleName;

/**
 *获取IMEI
 *
 *@return 返回IMEI
 */
+ (NSString *)getIMEI;

/**
 *获取设备版本
 *
 *@return 返回手机型号
 */
+ (NSString *)currentDeviceScreen;

/**
 *创建验证code
 *
 *@param date 时间戳

 *@param param 加密字典
 *
 *@return 返回MD5加密字符
 */
+ (NSString *)creatTheCodeWithDate:(NSString *)date Param:(id)param;
/**
 *获取当前时间戳
 *
 *@return 返回时间戳
 */
+ (NSString *)currentTimeStamp;
@end
