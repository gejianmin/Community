//
//  NSString+Util.h
//  UsedCar
//
//  Created by Alan on 13-11-8.
//  Copyright (c) 2013年 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Util)

/**
    md5加密
 */
- (NSString *)md5;

/**
    去掉字符串两端空格
 */
- (NSString *)trim;
/**
    哈希值
 */
- (NSString *)sha1;

/**
    3DES加密解密
 */
- (NSString *)encrypt3DES:(NSString *)key iv:(NSString *)iv;
- (NSString *)decrypt3DES:(NSString *)key iv:(NSString *)iv;

/**
    AES加密解密
 */
- (NSString *)encryptAES:(NSString *)key;
- (NSString *)decryptAES:(NSString *)key;

/*是否包含中文*/
- (BOOL)isContainsChinese;
/**
 判断emoji
 */
-(BOOL)isContainsEmoji;

//是不是链接
-(BOOL)isURL;

+ (NSString *)decodeUTF8ToChinese:(NSString *)encodeStr;
+ (NSString *)encodeChineseToUTF8:(NSString *)encodeStr;

/* 调整行间距 */
-(NSMutableAttributedString *)lineSpacing:(NSInteger)spc;

@end



@interface NSString(NSDate)
/**
    返回一个秒单位的时间戳
 */
+(NSString *)timeStamp;
/**
    返回指定格式的指定时间的字符串时间
 */
+(NSString *)dateFmtStr:(NSString *)fmt date:(NSDate *)date;
/**
    返回中文格式化描述的时间字符串
    e.g. 1分钟前,2天前
 */
+(NSString *)timeIntervalDescription:(NSDate *)date;
/**
    返回一个指定格式的且指定时间字符串的格式化字符串(返回格式和指定格式要一致)
 */
+(NSString *)fmtDateString:(NSString *)date withFmt:(NSString *)fmt;
/**
    返回一个指定格式时间格式化的DateComponents
 */
-(NSDateComponents *)componentsWithFormat:(NSString *)fmt;
/**
    返回一个格式为yyyy-MM-hh的时间戳转换好的时间字符串
 */
+ (NSString *)stringFromDate:(NSNumber *)number;
/**
    返回一个星座
 */
+ (NSString *)getConstellation:(NSDate *)date;
+(NSString *)nowDateFmtStr:(NSString *)fmt;
/**
 返回时间格式
 */
+(NSString *)stringTrasformToDate:(NSString *)dateStr;


/**
    自定义处理时间字符串
 */

+ (NSString *)getHandlingTimeString:(NSString *)date;

/**
 字符串替换

 @param curString 当前字符串
 @param range 替换的位置 NSMakeRange(3, 6)
 @param replaceString 要替换的字符串
 @return 字符串
 */
+(NSString *)stringWithCurString:(NSString *)curString range:(NSRange)range replaceString:(NSString *)replaceString;

/**
 数字时间戳转时间

 @param dataStr 数字时间戳
 @return 时间
 */
+(NSString *)stringTrasformtoDateString:(NSString *)dataStr;

/**
 字符串转字典

 @param jsonString json字符串
 @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/**
 字符串转数组
 
 @param arrayString json字符串
 @return 数组
 */
+(NSArray *)stringTrasformtoArray:(NSString *)arrayString;
//图片转字符串
+ (NSString *)UIImageToBase64Str:(UIImage *)image;
@end
