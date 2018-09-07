//
//  LoginView.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/9.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginView;
@protocol LoginViewDelegate <NSObject>

@optional

- (void)loginViewDidLoginWithAccount:(NSString *)account password:(NSString *)password;
- (void)loginViewDidLogin:(UIButton *)loginButton;

@end

@interface LoginView : UIView

@property (nonatomic, strong) UITextField *accountField;
@property (nonatomic, strong) UITextField *passwordField;

@property (nonatomic, weak) id <LoginViewDelegate> delegate;

@end
