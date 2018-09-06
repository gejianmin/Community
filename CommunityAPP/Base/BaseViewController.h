//
//  BaseViewController.h
//  55BBS
//
//  Created by KepenJ on 2017/3/3.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseViewController : UIViewController
@property (nonatomic, strong) UIColor *barBackGroundColor;//bar背景颜色
@property (nonatomic, copy) NSString *headTitle;
- (void)navBarBackItem;
- (void)setLeftItemWithImageTarget:(id)target;
- (void)setLeftItemWithTitle:(NSString *)title
                      Target:(id)target;

- (void)setRightItemWithImageTarget:(id)target;

- (void)setRightItemWithTitle:(NSString *)title
                       Target:(id)target;
- (void)next;
@end
