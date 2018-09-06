//
//  NSString+Helper.h
//  AppFor55BBS
//
//  Created by 周宇 on 13-11-4.
//  Copyright (c) 2013年 zol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Helper)
//获取汉子的frame
CGSize SizeOfNSString (NSString * string, CGFloat witdh, CGFloat heigh ,CGFloat fontSize,NSString * fontName);

+ (BOOL)isBlankString:(NSString *)string;
- (NSString *)urlEncode;
- (NSString *)urlDecode;
+ (CGSize)sizeOfString:(NSString *)string Heigh:(float)heigh Width:(float)width Font:(UIFont *)font;
+ (BOOL)regexVerify:(NSString *)inputed regex:(NSString *)aRegex;
+ (NSInteger)countOfChineseAndEnglishString:(NSString *)string;
+ (BOOL)stringContainsEmoji:(NSString *)string;
@end
