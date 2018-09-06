//
//  NetWorkTool.m
//  55BBS
//
//  Created by KepenJ on 2017/2/24.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "NetWorkTool.h"
//#import <BBSThirdsPlaform/OpenUDID.h>
#import "sys/utsname.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSString+Helper.h"

@implementation NetWorkTool

+ (NSString *)appVersion {
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *versionNum = [infoDict objectForKey:@"CFBundleShortVersionString"];
    return versionNum;
}

+ (NSString *)bundleName {
    NSDictionary *infoDict =[[NSBundle mainBundle] infoDictionary];
    return [infoDict objectForKey:@"CFBundleName"];
}
//+ (NSString *)getIMEI{
//    return [OpenUDID value];
//}
+ (NSString *)currentDeviceScreen
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceString isEqualToString:@"iPhone3,1"]||[deviceString isEqualToString:@"iPhone3,2"]||[deviceString isEqualToString:@"iPhone4,1"])
    {
        return @"4";
    }
    else if ([deviceString isEqualToString:@"iPhone5,2"]||[deviceString isEqualToString:@"iPhone6,2"])
    {
        return @"5";
    }
    else if ([deviceString isEqualToString:@"iPhone7,2"]||[deviceString isEqualToString:@"iPhone8,1"])
    {
        return @"6";
    }
    else if ([deviceString isEqualToString:@"iPhone7,1"]||[deviceString isEqualToString:@"iPhone8,2"])
    {
        return @"6p";
    }
    return @"5";
}
/**
 *  MD5加密字符串
 *
 */
+ (NSString *)encryptMD5With:(NSString *)string {
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (NSString *)configTheParam:(id)param {
    if ([param isKindOfClass:[NSArray class]]) {
        NSMutableString * mString = [[NSMutableString alloc]initWithCapacity:[(NSArray *)param count]];
        for (id tempDic in param) {
            if ([tempDic isKindOfClass:[NSDictionary class]]) {
                NSArray * keys = [tempDic allKeys];
                [mString appendFormat:@"%@",[tempDic objectForKey:[keys lastObject]]];
            }
        }
        return mString;
    }
    else if ([param isKindOfClass:[NSString class]])
    {
        return param;
    }
    return nil;
}
/**
 *  创建验证code

 */
+ (NSString *)creatTheCodeWithDate:(NSString *)date Param:(id)param{
    if (![NSString isBlankString:date] && [param isKindOfClass:[NSArray class]]){
        NSString *MD5 = [self encryptMD5With:[self configTheParam:param]];
        NSString * paramString = [NSString stringWithFormat:@"%@%@",date,MD5];
        return [self encryptMD5With:[self configTheParam:paramString]];;
    }else{
        return nil;
    }
}
+ (NSString *)currentTimeStamp {
    return [NSString stringWithFormat:@"%.f", [[NSDate date] timeIntervalSince1970]];
}
@end
