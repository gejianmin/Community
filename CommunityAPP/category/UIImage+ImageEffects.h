//
//  UIImage+ImageEffects.h
//  AppFor55BBS
//
//  Created by KepenJ on 15/11/12.
//  Copyright © 2015年 55BBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageEffects)
- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;
@end
