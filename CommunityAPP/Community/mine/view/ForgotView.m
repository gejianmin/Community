//
//  ForgotView.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/7.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "ForgotView.h"
#import "HHValidateButton.h"


@interface ForgotView ()<HHCaptchaButtonDelegate>

@property(nonatomic,strong) UIView *phoneNumView;
@property(nonatomic,strong) HHCaptchaButton *getValidateBtn;
@property(nonatomic,strong) HHTextField  * phoneNumField;
@property(nonatomic,strong) UIView *vfView;
@property(nonatomic,strong) HHTextField  * vfField;
@property(nonatomic,strong) UIView *psdView;
@property(nonatomic,strong) HHTextField  * psdField;
@property(nonatomic,strong) UIView *repsdView;
@property(nonatomic,strong) HHTextField  * repsdField;

@property(nonatomic,strong) CustomBtn  * postBtn;

@end
@implementation ForgotView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.phoneNumView];
        [self.phoneNumView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(self);
            make.top.mas_equalTo(self.mas_top).offset(0);
            make.height.equalTo(@50);
        }];
        [self.phoneNumView addSubview:self.getValidateBtn];
        
        [self.getValidateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.phoneNumView.mas_right).offset(-15);
            make.centerY.mas_equalTo(self.phoneNumView.mas_centerY).offset(0);
            make.height.equalTo(@40);
            make.width.equalTo(@120);
        }];
        
        [self.phoneNumView addSubview:self.phoneNumField];
        [self.phoneNumField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.phoneNumView.mas_left).offset(15.f);
            make.right.mas_equalTo(self.getValidateBtn.mas_left).offset(-15);
            make.centerY.mas_equalTo(self.phoneNumView.mas_centerY).offset(0);
            make.height.equalTo(@50);
        }];
        [self addSubview:self.vfView];
        [self.vfView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(0.f);
            make.right.mas_equalTo(self.mas_right).offset(0);
            make.top.mas_equalTo(self.phoneNumView.mas_bottom).offset(0.5);
            make.height.equalTo(@50);
        }];
        [self addSubview:self.vfField];
        [self.vfField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.vfView.mas_left).offset(15.f);
            make.right.mas_equalTo(self.vfView.mas_right).offset(-15.0f);
            make.centerY.mas_equalTo(self.vfView.mas_centerY).offset(0);
            make.height.equalTo(@50);
        }];
        [self addSubview:self.psdView];
        [self.psdView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(0.f);
            make.right.mas_equalTo(self.mas_right).offset(0);
            make.top.mas_equalTo(self.vfView.mas_bottom).offset(0.5);
            make.height.equalTo(@50);
        }];
        [self.psdView addSubview:self.psdField];
        [self.psdField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.psdView.mas_left).offset(15.f);
            make.right.mas_equalTo(self.psdView.mas_right).offset(-15.0f);
            make.centerY.mas_equalTo(self.psdView.mas_centerY).offset(0);
            make.height.equalTo(@50);
        }];
        [self addSubview:self.repsdView];
        [self.repsdView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(0.f);
            make.right.mas_equalTo(self.mas_right).offset(0);
            make.top.mas_equalTo(self.psdView.mas_bottom).offset(0.5);
            make.height.equalTo(@50);
        }];
        [self.repsdView addSubview:self.repsdField];
        [self.repsdField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.repsdView.mas_left).offset(15.f);
            make.right.mas_equalTo(self.repsdView.mas_right).offset(-15.0f);
            make.centerY.mas_equalTo(self.repsdView.mas_centerY).offset(0);
            make.height.equalTo(@50);
        }];
        [self addSubview:self.postBtn];
        [self.postBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(15.f);
            make.right.mas_equalTo(self.mas_right).offset(-15.0f);
            make.top.mas_equalTo(self.repsdView.mas_bottom).offset(20);
            make.height.equalTo(@44);
        }];
        
        
    }
    return self;
}
-(UIView *)phoneNumView{
    if (!_phoneNumView) {
        _phoneNumView = [[UIView alloc]initWithFrame:CGRectZero color:kColorWhite];
    }
    return _phoneNumView;
}
-(HHCaptchaButton *)getValidateBtn{
    if (!_getValidateBtn) {
        _getValidateBtn = [[HHCaptchaButton alloc]init];
        _getValidateBtn.delegate=self;
        [_getValidateBtn addTarget:self action:@selector(getValidateButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _getValidateBtn.titleLabel.font = kFont12;
        [_getValidateBtn setBackgroundColor:kColorRed];
        _getValidateBtn.cornerRadius = 5.0f;
        [_getValidateBtn sizeToFit];
    }
    return _getValidateBtn;
}
-(void)getValidateButtonAction:(HHCaptchaButton *)sender{
    if ([self .delegate respondsToSelector:@selector(forgotViewGetVFWithButton: phoneNum:)]) {
        [self.delegate forgotViewGetVFWithButton:sender phoneNum:self.phoneNumField.text];
    }
    
    
}
-(void)loginEvent:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(forgotViewDidLoginWithPhoneNum:VFNum:password:rePassword:)]) {
        [self.delegate forgotViewDidLoginWithPhoneNum:self.phoneNumField.text VFNum:self.vfField.text password:self.psdField.text rePassword:self.repsdField.text];
    }
}

-(HHTextField *)phoneNumField{
    if (!_phoneNumField) {
        _phoneNumField = [[HHTextField alloc]initWithFrame:CGRectZero leftImageName:@"iphone"];
        [_phoneNumField setFont:kFont15];
        [_phoneNumField setTextColor:kColorGray1];
        [_phoneNumField setTextAlignment:NSTextAlignmentLeft];
        [_phoneNumField setPlaceholder:@"请输入手机号"];
        [_phoneNumField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_phoneNumField setKeyboardType:UIKeyboardTypeNumberPad];
        _phoneNumField.maxTextLength = 11;
    }
    return _phoneNumField;
}
-(UIView *)vfView{
    if (!_vfView) {
        _vfView = [[UIView alloc]initWithFrame:CGRectZero color:kColorWhite];
    }
    return _vfView;
}
-(HHTextField *)vfField{
    if (!_vfField) {
        _vfField = [[HHTextField alloc]initWithFrame:CGRectZero leftImageName:@"register_code"];
        [_vfField setFont:kFont15];
        [_vfField setTextColor:kColorGray1];
        [_vfField setTextAlignment:NSTextAlignmentLeft];
        [_vfField setPlaceholder:@"请输入验证码"];
        [_vfField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_vfField setKeyboardType:UIKeyboardTypeNumberPad];
        _vfField.maxTextLength = 6;
    }
    return _vfField;
}
-(UIView *)psdView{
    if (!_psdView) {
        _psdView = [[UIView alloc]initWithFrame:CGRectZero color:kColorWhite];
    }
    return _psdView;
}
-(HHTextField *)psdField{
    if (!_psdField) {
        _psdField = [[HHTextField alloc]initWithFrame:CGRectZero leftImageName:@"password"];
        [_psdField setFont:kFont15];
        [_psdField setTextColor:kColorGray1];
        [_psdField setTextAlignment:NSTextAlignmentLeft];
        [_psdField setPlaceholder:@"请输入(6到15位)的密码"];
        [_psdField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_psdField setKeyboardType:UIKeyboardTypeNumberPad];
        _psdField.maxTextLength = 15;
    }
    return _psdField;
}
-(UIView *)repsdView{
    if (!_repsdView) {
        _repsdView = [[UIView alloc]initWithFrame:CGRectZero color:kColorWhite];
    }
    return _repsdView;
}
-(HHTextField *)repsdField{
    if (!_repsdField) {
        _repsdField = [[HHTextField alloc]initWithFrame:CGRectZero leftImageName:@"password"];
        [_repsdField setFont:kFont15];
        [_repsdField setTextColor:kColorGray1];
        [_repsdField setTextAlignment:NSTextAlignmentLeft];
        [_repsdField setPlaceholder:@"请再次输入(6到15位)的密码"];
        [_repsdField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_repsdField setKeyboardType:UIKeyboardTypeNumberPad];
        _repsdField.maxTextLength = 15;
    }
    return _repsdField;
}
-(CustomBtn *)postBtn{
    
    if (!_postBtn) {
        _postBtn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:1000 Title:@"立即提交" backgroundColor:kColorRed TitleTextColor:kColorWhite Font:17 Image:nil];
        [_postBtn makeCornerWithCornerRadius:5 borderWidth:0 borderColor:nil];
        [_postBtn addTarget:self action:@selector(loginEvent:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _postBtn;
}
@end
