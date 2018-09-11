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

@interface LoginViewController : BaseViewController

@property(nonatomic,copy) LoginSuccess   loginSuccess;
@property(nonatomic,copy) LoginCancel    loginCanel;


+ (instancetype)showControllerWithSuccess:(LoginSuccess )loginSuccess cancel:(LoginCancel )loginCanel;
    


@end


