//
//  ForgotView.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/7.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ForgotView;
@protocol ForgotViewDelegate <NSObject>

@optional

- (void)forgotViewDidLoginWithPhoneNum:(NSString *)phoneNum VFNum:(NSString *)VCNum password:(NSString *)password rePassword:(NSString *)repassword;
- (void)forgotViewGetVFButtonWithPhoneNum:(NSString *)phoneNum;;

@end

@interface ForgotView : UIView
@property (nonatomic, weak) id <ForgotViewDelegate> delegate;


@end

