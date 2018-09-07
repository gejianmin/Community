//
//  NSObject+Util.m
//  HuanYouWang
//
//  Created by liuwenjie on 15/5/15.
//  Copyright (c) 2015年 cc.huanyouwang. All rights reserved.
//

#import "NSObject+Util.h"
#import <objc/runtime.h>
@implementation NSObject (Util)

-(void)delay:(NSTimeInterval)timer task:(dispatch_block_t)task{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        task();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    });
}
- (void)fastEncode:(NSCoder *)aCoder{
    
    u_int count=0;
    objc_property_t *properties=class_copyPropertyList([self class], &count);
    for (int i=0; i<count; i++) {
        const char* pname=property_getName(properties[i]);
        NSString *key=[NSString stringWithUTF8String:pname];
        id value=[self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(properties);

}
-(void)fastDecode:(NSCoder *)aDecoder{
    u_int count=0;
    objc_property_t *properties=class_copyPropertyList([self class], &count);
    for (int i=0; i<count; i++) {
        const char* pname=property_getName(properties[i]);
        NSString *key=[NSString stringWithUTF8String:pname];
        id value=[aDecoder decodeObjectForKey:key];
        if (value) {
            [self setValue:value forKey:key];
        }
    }
    free(properties);
}
#pragma 判断字符串是否是空值
+(BOOL)isBlankString:(NSString *)string {
    
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber
{
    
    // 13 14 15 166 17 18 199
    NSString *pattern = @"^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(166)|(17[0,1,3,5-8])|(18[0-9])|(199))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}
#pragma 获取微信APPID
+ (NSString *)getweChatAPPID{
    
    NSDictionary * dict = [[NSBundle mainBundle]infoDictionary];
    NSArray * arrTemp =  [dict objectForKey:@"CFBundleURLTypes"];
    for (NSDictionary * dicTemp in arrTemp) {
        NSString * URLName = [dicTemp objectForKey:@"CFBundleURLName"];
        if ([@"wechat" isEqualToString:URLName]) {
            NSArray * arrTemp1 =  [dicTemp objectForKey:@"CFBundleURLSchemes"];
            NSString * result = [arrTemp1 firstObject];
            return result;
        }
    }
    return nil;
}
-(NSInteger )compareWithFutureDay:(NSString *)futureDay{
    
    if (![NSObject isBlankString:futureDay]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY年MM月dd日"];
        NSString *oneDayStr = [dateFormatter stringFromDate:[NSDate date]];
        NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
        
        NSDateFormatter *dateFormatterB = [[NSDateFormatter alloc] init];
        [dateFormatterB setDateFormat:@"YYYY年MM月dd日"];
        NSDate *dateB = [dateFormatterB dateFromString:futureDay];
        
        NSComparisonResult result = [dateA compare:dateB];
        if (result == NSOrderedDescending) {
            NSLog(@"日期在当前时间之前");
            return 1;
        }else if (result == NSOrderedAscending){
            NSLog(@"日期在当前时间之后");
            return 2;
        }else{
            NSLog(@"日期相同");
            return 3;
        }
    }else{
        return 0;
    }
}
@end
