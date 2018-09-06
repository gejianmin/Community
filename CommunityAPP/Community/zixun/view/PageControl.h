//
//  PageControl.h
//  AppFor55BBS
//
//  Created by 周宇 on 13-11-12.
//  Copyright (c) 2013年 zol. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  自定义UIPageControl, 用于改变导航小圆点不明显问题 (兼容iOS7)
 *
 *  @author zhouyu
 *  @version v4.0.0
 *  @修改历史
 *   修改版本    作者名     修改明细
 */
@interface PageControl : UIPageControl
@property (nonatomic, strong) UIImage *activeImage;
@property (nonatomic, strong) UIImage *inactiveImage;
@property (nonatomic, strong) NSArray *usedToRetainOriginalSubview;
@property (nonatomic, assign) CGFloat kSpacing;
@end
