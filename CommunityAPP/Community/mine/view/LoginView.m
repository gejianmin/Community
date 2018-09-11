//
//  LoginView.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/9.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//
#import "LoginView.h"

@interface LoginView ()

    
@property (nonatomic, strong) CustomBtn *cancelBtn;

@property (nonatomic ,strong) UILabel *accountLabel;
@property (nonatomic, strong) UILabel *passWordLabel;

@property (nonatomic, strong) UIView *accountBackView;
@property (nonatomic, strong) UIView *passWordBackView;

@property (nonatomic ,strong) UIImageView *accountIcon;
@property (nonatomic, strong) UIImageView *passWordIcon;

@property (nonatomic, strong) UIButton *selectPasswordButton;
@property (nonatomic, strong) UILabel *selectPasswordLabel;
@property (nonatomic, strong) UIButton *selectAutoLoginButton;
@property (nonatomic, strong) UILabel *selectAutoLoginLabel;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *phoneCodeLoginButon;
@property (nonatomic, strong) UIButton *forgetPasswordButton;
@property (nonatomic, strong)  UIButton * shareButton;


@end
@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.cancelBtn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:1004 Title:nil backgroundColor:kColorClear TitleTextColor:nil Font:0 Image:ImageNamed(@"icon_back")];
        [self.cancelBtn addTarget:self action:@selector(loginEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelBtn];
        
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(15);
            make.top.equalTo(self.mas_top).offset(20);
            make.height.equalTo(@20);
            make.width.equalTo(@33);
        }];
        
        UIImageView * iconView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60) color:kColorClear];
        [iconView makeCornerWithCornerRadius:8 borderWidth:0 borderColor:kColorClear];
        iconView.image = ImageNamed(@"icon");
        [self addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(20 + GSANavHeight);
            make.centerX.equalTo(self.mas_centerX);
            make.height.width.equalTo(@60);
        }];
        
        self.accountBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 50)];
        [self addSubview:self.accountBackView];
        self.accountBackView.backgroundColor = [UIColor whiteColor];
        
        self.accountIcon = [[UIImageView alloc]init];
        self.accountIcon.image = ImageNamed(@"ic_mobile_flag");
        [self.accountBackView addSubview:self.accountIcon];
        [self.accountIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(20);
            make.centerY.equalTo(self.accountBackView.mas_centerY);
            make.height.width.equalTo(@25);
        }];
        
        self.accountField = [[UITextField alloc] init];
        [self.accountBackView addSubview:self.accountField];
        self.accountField.left = 50;
        self.accountField.width = SCREEN_WIDTH - 110;
        self.accountField.height = 30;
        self.accountField.centerY = self.accountBackView.height/2;
        self.accountField.placeholder = @"请输入手机号";
        self.accountField.font = FONT(13);
        self.accountField.keyboardType = UIKeyboardTypePhonePad;
        self.accountField.textColor = kColorBlack;
        self.accountField.maxTextLength = 11;
        self.passWordBackView = [[UIView alloc] initWithFrame:CGRectMake(0, self.accountBackView.bottom + 8, SCREEN_WIDTH, 50)];
        [self addSubview:self.passWordBackView];
        self.passWordBackView.backgroundColor = [UIColor whiteColor];
        
        self.passWordIcon = [[UIImageView alloc]init];
        self.passWordIcon.image = ImageNamed(@"ic_password_flag");
        [self.passWordBackView addSubview:self.passWordIcon];
        [self.passWordIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(15);
            make.centerY.equalTo(self.passWordBackView.mas_centerY);
            make.height.width.equalTo(@25);
        }];
        self.passwordField = [[UITextField alloc] init];
        [self.passWordBackView addSubview:self.passwordField];
        self.passwordField.left = 50;
        self.passwordField.width = SCREEN_WIDTH - 110;
        self.passwordField.height = 30;
        self.passwordField.centerY = self.passWordBackView.height/2;
        self.passwordField.placeholder = @"请输入密码";
        self.passwordField.font = FONT(13);
        self.passwordField.textColor = kColorBlack;
        
        
        self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
        self.loginButton.backgroundColor = [UIColor redColor];
        [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.loginButton.layer.cornerRadius = 5.0;
        self.loginButton.layer.masksToBounds = YES;
        [self.loginButton addTarget:self action:@selector(loginEvent:) forControlEvents:UIControlEventTouchUpInside];
        self.loginButton.tag = 1000;
        [self addSubview:self.loginButton];
        self.loginButton.frame = CGRectMake(18, self.passWordBackView.bottom + 50, SCREEN_WIDTH - 36, 50);
        self.loginButton.centerX = self.width/2;
        
        self.selectPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.selectPasswordButton.backgroundColor = [UIColor clearColor];
        [self.selectPasswordButton setTitle:@"立即注册" forState:UIControlStateNormal];
        [self.selectPasswordButton setTitleColor:kColorRed forState:UIControlStateNormal];
        [self addSubview:self.selectPasswordButton];
        self.selectPasswordButton.left = self.loginButton.left+5;
        self.selectPasswordButton.top = self.loginButton.bottom + 20;
        self.selectPasswordButton.tag = 1001;
        self.selectPasswordButton.size = CGSizeMake(80, 20);
        [self.selectPasswordButton addTarget:self action:@selector(loginEvent:) forControlEvents:UIControlEventTouchUpInside];


        self.selectAutoLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.selectAutoLoginButton.backgroundColor = [UIColor clearColor];
        [self.selectAutoLoginButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [self.selectAutoLoginButton setTitleColor:kColorBlack forState:UIControlStateNormal];
        self.selectAutoLoginButton.tag = 1002;
        [self addSubview:self.selectAutoLoginButton];
        self.selectAutoLoginButton.size = CGSizeMake(80, 20);
        self.selectAutoLoginButton.right = self.loginButton.right - 5;
        self.selectAutoLoginButton.centerY = self.selectPasswordButton.centerY;
        [self.selectAutoLoginButton addTarget:self action:@selector(loginEvent:) forControlEvents:UIControlEventTouchUpInside];

        
        //分享
        self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.shareButton.backgroundColor = [UIColor clearColor];
        [self.shareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.shareButton setBackgroundImage:ImageNamed(@"share_weixin") forState:UIControlStateNormal];
        self.shareButton.tag = 1003;
        [self addSubview:self.shareButton];
        [self.shareButton addTarget:self action:@selector(loginEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(-30);
            make.centerX.equalTo(self.mas_centerX);
            make.height.width.equalTo(@50);
        }];
        [self.shareButton makeCornerWithCornerRadius:25 borderWidth:0 borderColor:kColorClear];

    }
    
    return self;
}

-(void)loginEvent:(UIButton *)sender{
    if (sender.tag == 1000) {
        if ([self.delegate respondsToSelector:@selector(loginViewDidLoginWithAccount:password:)]) {
            [self.delegate loginViewDidLoginWithAccount:self.accountField.text password:self.passwordField.text];
        }
    }else{
    if ([self.delegate respondsToSelector:@selector(loginViewDidLogin:)]) {
        [self.delegate loginViewDidLogin:sender];
    }
    }
}


@end
