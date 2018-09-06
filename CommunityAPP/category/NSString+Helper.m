//
//  NSString+Helper.m
//  AppFor55BBS
//
//  Created by 周宇 on 13-11-4.
//  Copyright (c) 2013年 zol. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

CGSize SizeOfNSString (NSString * string, CGFloat witdh, CGFloat heigh ,CGFloat fontSize,NSString * fontName){
    
    if (witdh ==0 && heigh != 0) {
        witdh = MAXFLOAT;
    }
    else if (witdh != 0 && heigh == 0) {
        heigh = MAXFLOAT;
    }
    else if (witdh == 0 && heigh == 0) {
        witdh = MAXFLOAT;
        heigh = MAXFLOAT;
    }
    CGSize size;

    if (fontName && fontSize) {
        NSDictionary *attribute = @{NSFontAttributeName:[UIFont fontWithName:fontName size:fontSize]};
        size = [string boundingRectWithSize:CGSizeMake(witdh, heigh) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    }
    else {
        NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
        size = [string boundingRectWithSize:CGSizeMake(witdh, heigh) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    }
    return size;
}

/**
 *  判断字符串是否为空
 *
 *  @author zhouyu
 *  @version v4.0.0
 *  @param string 所需判断字符串
 *  @return 是否为空
 *  @修改历史
 *   修改版本    作者名     修改明细
 */
+ (BOOL)isBlankString:(NSString *)string {
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

/**
 *  用UTF-8格式对URL字符串编码
 *
 *  @author zhouyu
 *  @version v4.0.0
 *  @return 编码后的字符串
 *  @修改历史
 *   修改版本    作者名     修改明细
 */
- (NSString *)urlEncode {
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

/**
 *  用UTF-8格式对URL字符串解码
 *
 *  @author zhouyu
 *  @version v4.0.0
 *  @return 解码后的字符串
 *  @修改历史
 *   修改版本    作者名     修改明细
 */
- (NSString *)urlDecode {
//    NSString *filtered = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
//	NSString *res = [filtered stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    return res;
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

}
/**
 *  计算字符串size
 *
 *  @author xiayin
 *  @version v4.0.4
 *  @param heigh        固定的高度，求长度
 *  @param width        固定的长度，求高度
 *  @param fontSize     字体大小
 *  @return size
 *  @修改历史
 *   修改版本    作者名     修改明细
 */
+ (CGSize)sizeOfString:(NSString *)string Heigh:(float)heigh Width:(float)width Font:(UIFont *)font
{
    CGSize size;
    if ((heigh == MAXFLOAT && (width != MAXFLOAT && width > 0.0f)) || ((heigh != MAXFLOAT && heigh > 0.0f) && width == MAXFLOAT)) {
        size = [string drawInRect:CGRectMake(0, 0, width, heigh) withFont:font lineBreakMode:NSLineBreakByWordWrapping];
    }
    return size;
}
/**
 *  通过正则表达式验证字符串
 *
 *  @author zhouyu
 *  @version v4.0.0
 *  @param inputed 需要验证的字符串
 *  @param aRegex  正则表达式
 *  @return 是否符合规则
 *  @修改历史
 *   修改版本    作者名     修改明细
 */
+ (BOOL)regexVerify:(NSString *)inputed regex:(NSString *)aRegex {
    
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", aRegex];
	
    return [predicate evaluateWithObject:inputed];

}

/**
 *  字体格式对应（整个string）
 *  version:v4.0.6
 *  author:xiayin
 *
 *  @param string 需要修改的string
 *
 *  @return 修改完成后的string
 */
+ (NSInteger)countOfChineseAndEnglishString:(NSString *)string{
    NSInteger count = 0;
    for (int i = 0; i < [string length]; i++) {
        unichar c = [string characterAtIndex:i];
        if (c >=0x4E00 && c <=0x9FFF)
        {
            count += 2;
        }
        else {
            count += 1;
        }
    }
    return count;

}

/**
 *  检验字符串中是否有自带表情（整个string）
 *  version:v5.4.0
 *  author:qiaoqi
 *
 *  @param string 需要检测的string
 *
 *  @return 检测结果
 */
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                NSLog(@"hshshshshshs：%hu",hs);
                                if (0xd800 <= hs && hs <= 0xdbff)
                                {
                                    if (substring.length > 1)
                                    {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f)
                                        {
                                            returnValue = YES;
                                        }
                                    }
                                }
                                else if (substring.length > 1)
                                {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3)
                                    {
                                        returnValue = YES;
                                    }
                                }
                                else
                                {
                                    if (0x2100 <= hs && hs <= 0x27ff)
                                    {
                                        returnValue = YES;
                                    }
                                    else if (0x2B05 <= hs && hs <= 0x2b07)
                                    {
                                        returnValue = YES;
                                    }
                                    else if (0x2934 <= hs && hs <= 0x2935)
                                    {
                                        returnValue = YES;
                                    }
                                    else if (0x3297 <= hs && hs <= 0x3299)
                                    {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    return returnValue;
}

@end
