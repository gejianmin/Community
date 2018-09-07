//
//  HHTextView.h
//  HHKit
//
//  Created by 赵东 on 2018/3/5.
//  Copyright © 2018年 HHAuto. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HH_textHeightChangedBlock)(NSString *text,CGFloat textHeight);


@interface HHTextView : UITextView

/**
 *  占位文字
 */
@property (nonatomic, strong) NSString *placeholder;

/**
 *  占位文字颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;

/**
 *  边框颜色
 */
@property (nonatomic, strong) UIColor *borderColor;

/**
 *  占位符字体大小
 */
@property (nonatomic,strong) UIFont *placeholderFont;

/**
 *  textView最大行数
 */
@property (nonatomic, assign) NSUInteger maxNumberOfLines;

/**
 *  文字最多数字 默认100个
 */
@property (nonatomic,assign) NSInteger  maxNumber;

/**
 *  文字高度改变block → 文字高度改变会自动调用
 *  block参数(text) → 文字内容
 *  block参数(textHeight) → 文字高度
 */
@property (nonatomic, strong) HH_textHeightChangedBlock textChangedBlock;
/**
 *  设置圆角
 */
@property (nonatomic, assign) NSUInteger cornerRadius;

- (void)textValueDidChanged:(HH_textHeightChangedBlock)block;


@end
