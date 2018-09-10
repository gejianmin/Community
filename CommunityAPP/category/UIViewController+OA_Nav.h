//
//  UIViewController+OA_Nav.h
//  JTDOASystem
//
//  Created by 王帅宇 on 2018/7/6.
//  Copyright © 2018年 JuTongDa Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (OA_Nav)

- (void)addLeftBarItemWithImage:(UIImage *)image target:(id)target action:(SEL)selector;
- (void)addRightBarItemWithImage:(UIImage *)image target:(id)target action:(SEL)selector;
- (void)addRightBarItemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor target:(id)target action:(SEL)selector;
- (void)addRightTwoBarItemWithImage:(UIImage *)image image2:(UIImage *)image2 target:(id)target target2:(id)target2 action:(SEL)selector action2:(SEL)selector2;
- (void)addRightBarItemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor backgroudColor:(UIColor *)bgcolor target:(id)target action:(SEL)selector;


- (void)addRightDefaultBarItemWithTitle:(NSString *)title target:(id)target action:(SEL)selector;

- (void)setupLeftBarButton;
@end
