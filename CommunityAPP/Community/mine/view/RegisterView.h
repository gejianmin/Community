//
//  RegisterView.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/8.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RegisterView;
@protocol RegisterViewDelegate <NSObject>

@optional

- (void)registerViewDidLoginWithPhoneNum:(NSString *)phoneNum VFNum:(NSString *)VCNum password:(NSString *)password rePassword:(NSString *)repassword;
- (void)registerViewGetVFWithButton:(HHCaptchaButton *)sender phoneNum:(NSString *)phoneNum;

@end

@interface RegisterView : UIView
@property (nonatomic, weak) id <RegisterViewDelegate> delegate;

@end
