//
//  LoginView.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/9.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//
#import "LoginView.h"

@interface LoginView ()

@property (nonatomic ,strong) UILabel *accountLabel;
@property (nonatomic, strong) UILabel *passWordLabel;
@property (nonatomic, strong) UIView *accountBackView;
@property (nonatomic, strong) UIView *passWordBackView;

@property (nonatomic, strong) UIButton *selectPasswordButton;
@property (nonatomic, strong) UILabel *selectPasswordLabel;
@property (nonatomic, strong) UIButton *selectAutoLoginButton;
@property (nonatomic, strong) UILabel *selectAutoLoginLabel;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *phoneCodeLoginButon;
@property (nonatomic, strong) UIButton *forgetPasswordButton;

@end
@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.accountBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 50)];
        [self addSubview:self.accountBackView];
        self.accountBackView.backgroundColor = [UIColor whiteColor];
        
        self.accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(18, 0, 80, 20)];
        self.accountLabel.text = @"账号:";
        self.accountLabel.font = FONT(13);
        self.accountLabel.textAlignment = NSTextAlignmentLeft;
        self.accountLabel.textColor = [UIColor blackColor];
        [self.accountBackView addSubview:self.accountLabel];
        self.accountLabel.centerY = self.accountBackView.height/2;
        
        self.accountField = [[UITextField alloc] init];
        [self.accountBackView addSubview:self.accountField];
        self.accountField.left =100;
        self.accountField.width = SCREEN_WIDTH - 110;
        self.accountField.height = 30;
        self.accountField.centerY = self.accountBackView.height/2;
        self.accountField.placeholder = @"手机号/会员";
        self.accountField.font = FONT(13);
        self.accountField.textColor = RGB(174, 174, 174);
        
        self.passWordBackView = [[UIView alloc] initWithFrame:CGRectMake(0, self.accountBackView.bottom + 8, SCREEN_WIDTH, 50)];
        [self addSubview:self.passWordBackView];
        self.passWordBackView.backgroundColor = [UIColor whiteColor];
        
        self.passWordLabel = [[UILabel alloc] initWithFrame:CGRectMake(18, 0, 80, 20)];
        self.passWordLabel.text = @"登录密码:";
        self.passWordLabel.textAlignment = NSTextAlignmentLeft;
        self.passWordLabel.textColor = [UIColor blackColor];
        self.passWordLabel.font = FONT(13);
        [self.passWordBackView addSubview:self.passWordLabel];
        self.passWordLabel.centerY = self.passWordBackView.height/2;
        
        self.passwordField = [[UITextField alloc] init];
        [self.passWordBackView addSubview:self.passwordField];
        self.passwordField.left = 100;
        self.passwordField.width = SCREEN_WIDTH - 110;
        self.passwordField.height = 30;
        self.passwordField.centerY = self.passWordBackView.height/2;
        self.passwordField.placeholder = @"请输入密码";
        self.passwordField.font = FONT(13);
        self.passwordField.textColor = RGB(174, 174, 174);
        
        self.selectPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.selectPasswordButton.backgroundColor = [UIColor redColor];
        [self addSubview:self.selectPasswordButton];
        self.selectPasswordButton.left = self.accountLabel.left;
        self.selectPasswordButton.top = self.passWordBackView.bottom + 20;
        self.selectPasswordButton.size = CGSizeMake(20, 20);
        
        self.selectPasswordLabel = [[UILabel alloc] init];
        self.selectPasswordLabel.text = @"记住密码";
        self.selectPasswordLabel.textAlignment = NSTextAlignmentLeft;
        self.selectPasswordLabel.textColor = [UIColor blackColor];
        self.selectPasswordLabel.font = FONT(13);
        [self addSubview:self.selectPasswordLabel];
        self.selectPasswordLabel.size = CGSizeMake(100, 20);
        self.selectPasswordLabel.centerY = self.selectPasswordButton.centerY;
        self.selectPasswordLabel.left = self.selectPasswordButton.right + 8;

        self.selectAutoLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.selectAutoLoginButton.backgroundColor = [UIColor redColor];
        [self addSubview:self.selectAutoLoginButton];
        self.selectAutoLoginButton.size = CGSizeMake(20, 20);

        self.selectAutoLoginLabel = [[UILabel alloc] init];
        self.selectAutoLoginLabel.text = @"自动登录";
        self.selectAutoLoginLabel.font = FONT(13);
        self.selectAutoLoginLabel.textAlignment = NSTextAlignmentLeft;
        self.selectAutoLoginLabel.textColor = [UIColor blackColor];
        [self addSubview:self.selectAutoLoginLabel];
        self.selectAutoLoginLabel.centerY = self.selectPasswordButton.centerY;
        
        CGSize size = [self.selectAutoLoginLabel sizeForString:@"自动登录" font:self.selectAutoLoginLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 20)];
        self.selectAutoLoginLabel.size = CGSizeMake(size.width, 20);
        self.selectAutoLoginLabel.right = SCREEN_WIDTH - 18;
        self.selectAutoLoginLabel.centerY = self.selectPasswordButton.centerY;

        self.selectAutoLoginButton.right = self.selectAutoLoginLabel.left - 8;
        self.selectAutoLoginButton.centerY = self.selectPasswordButton.centerY;
        
        self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.loginButton setTitle:@"立即登录" forState:UIControlStateNormal];
        self.loginButton.backgroundColor = [UIColor redColor];
        [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.loginButton.layer.cornerRadius = 5.0;
        self.loginButton.layer.masksToBounds = YES;
        [self addSubview:self.loginButton];
        self.loginButton.frame = CGRectMake(18, self.selectAutoLoginLabel.bottom + 50, SCREEN_WIDTH - 36, 50);
        self.loginButton.centerX = self.width/2;
        
        self.phoneCodeLoginButon = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.phoneCodeLoginButon setTitle:@"手机动态短信登录" forState:UIControlStateNormal];
        self.phoneCodeLoginButon.titleLabel.font = FONT(13);
        [self.phoneCodeLoginButon setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self addSubview:self.phoneCodeLoginButon];
        CGSize codeSize = [self.phoneCodeLoginButon sizeForString:@"手机动态短信登录" font:self.phoneCodeLoginButon.titleLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 20)];
        self.phoneCodeLoginButon.frame = CGRectMake(18, self.loginButton.bottom + 20, codeSize.width, 20);
        
        self.forgetPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.forgetPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        self.forgetPasswordButton.titleLabel.font = FONT(13);
        [self.forgetPasswordButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self addSubview:self.forgetPasswordButton];
        CGSize forgeteSize = [self.forgetPasswordButton sizeForString:@"忘记密码" font:self.forgetPasswordButton.titleLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 20)];
        self.forgetPasswordButton.size = CGSizeMake(forgeteSize.width, 20);
        self.forgetPasswordButton.right = SCREEN_WIDTH - 18;
        self.forgetPasswordButton.top = self.loginButton.bottom + 20;
        
    }
    return self;
}




@end
