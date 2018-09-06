//
//  UIView+Helper.h
//  AppFor55BBS
//
//  Created by 周宇 on 13-11-21.
//  Copyright (c) 2013年 zol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Helper)
// 淡变动画
- (void)addAlpaDisplayAnimation;
- (void)removeHiddenAlpaAnimation;
// 边框
- (void)makeInsetShadow;
- (void)makeInsetShadowWithRadius:(float)radius Alpha:(float)alpha;
- (void)makeInsetShadowWithRadius:(float)radius Color:(UIColor *)color Directions:(NSArray *)directions;

@end
