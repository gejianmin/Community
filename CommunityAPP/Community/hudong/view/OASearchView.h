//
//  OASearchView.h
//  JTDOASystem
//
//  Created by gejianmin on 2018/7/11.
//  Copyright © 2018年 JuTongDa Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OASearchViewDelegate <NSObject>

@optional
- (void)searchViewShouldSearch:(NSString *)content;
- (void)searchViewDidTextChange:(NSString *)content;//实时获取

@end

@interface OASearchView : UIView

@property (nonatomic,weak) id <OASearchViewDelegate> delegate;
@property (nonatomic,strong) UIButton * placeHolderButton;
@property (nonatomic,strong) UITextField * searchTextField;
@property (nonatomic,strong) NSString * placeholder;
+ (CGFloat)height;

+(void)keyBoardResignFirstResponder;/*!< 隐藏键盘*/

- (BOOL)isContainWithStr:(NSString *)str sourceStr:(NSString *)sourceStr;

- (instancetype)initWithFrame:(CGRect)frame withDelegate:(id <OASearchViewDelegate>)delegate;

- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder withDelegate:(id <OASearchViewDelegate>)delegate;

@end

