//
//  UIViewController+OA_HUD.h
//  JTDOASystem
//
//  Created by 王帅宇 on 2018/7/6.
//  Copyright © 2018年 JuTongDa Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (OA_HUD)


/*!
 *  显示一个带有文字和菊花的HUD,需要手动hide
 */
- (void)showHUDText:(NSString *)text;


/*!
 *  显示一个不带菊花的提示性HUD,自动hide
 *  如果迭代多个则按队列出现和影藏
 *  只显示文字,没有图片
 */
- (void)showToastHUD:(NSString *)text;

/*!
 *  显示一个不带菊花的提示性HUD,自动hide
 *  如果迭代多个则按队列出现和影藏
 *  只显示文字,没有图片
 */
- (void)showToastHUD:(NSString *)text complete:(void (^)(void))complete;
/*!
 *  显示成功提示框,自动hide
 *  如果迭代多个则按队列出现和影藏
 *  显示文字和图片
 */
- (void)showSuccessToast:(NSString *)text complete:(void (^)(void))complete;
/*!
 *  显示失败提示框,自动hide
 *  如果迭代多个则按队列出现和影藏
 *  显示文字和图片
 */
- (void)showFailToast:(NSString *)text complete:(void (^)(void))complete;

/*!
 *  影藏HUD,适用于不能自动影藏的HUD
 */
- (void)hideHUD;


/** 分类中添加属性
 很多说法是只能添加方法，而不能添加成员变量或属性。
 
 有些人可能知道，这种说法是不严谨的，并不是绝对不能添加变量。
 
 解释如下：
 
 我们知道在一个类中用@property声明属性，编译器会自动帮我们生成_成员变量和setter/getter，但分类的指针结构体中，根本没有属性列表。所以在分类中用@property声明属性，既无法生成_成员变量也无法生成setter/getter。
 因此结论是：我们可以用@property声明属性，编译会通过，但run之后就会崩溃。
 
 
 
 既然报错的根本原因是使用了系统没有生成的setter/getter方法，可不可以在手动添加setter/getter来避免崩溃，完成调用呢？
 其实是可以的。由于OC是动态语言，方法真正的实现是通过runtime完成的，虽然系统不给我们生成setter/getter，但我们可以通过runtime手动添加setter/getter方法。
 */

@end
