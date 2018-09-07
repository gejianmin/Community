//
//  LoginViewController.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/9.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^LoginViewControllerCallBack)(BaseViewController *VC);

@interface LoginViewController : BaseViewController

/**
 监听登录事件
 
 @param callback 回调该控制器
 @return instance
 */
+ (instancetype)showWithCallBack:(LoginViewControllerCallBack)callback;

@end
