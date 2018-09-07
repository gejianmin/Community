//
//  UIColor+Utils.h
//  PersonToPerson
//
//  Created by abel on 15/4/20.
//  Copyright (c) 2015年 abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utils)

+ (UIColor *)colorFromHexString:(NSString *)hexString;
/**
 设置颜色渐变
 @param view 试图
 @param fromHexColor 开始颜色
 @param toHexColor 结束颜色
 @return
 */
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(UIColor *)fromHexColor toColor:(UIColor *)toHexColor;

@end
