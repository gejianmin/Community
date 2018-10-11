//
//  LoginViewController.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/9.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^LoginSuccess)(void);
typedef void(^LoginCancel)(void);
//验证token
typedef void(^VFTokenSuccess)(void);

@interface LoginViewController : BaseViewController

@property(nonatomic,copy) LoginSuccess   loginSuccess;
@property(nonatomic,copy) LoginCancel    loginCanel;
@property(nonatomic,copy) VFTokenSuccess   vFTokenSuccess;


+ (instancetype)showControllerWithSuccess:(LoginSuccess )loginSuccess cancel:(LoginCancel )loginCanel;

/**
 验证token是否失效，验证是否登录

 @param superController 传过来的控制器
 @param vFTokenSuccess 验证token成功回调
 */
+(void)verificationTokenWithSuperViewController:(UIViewController *)superController SuccessCallBack:(VFTokenSuccess )vFTokenSuccess;

@end


