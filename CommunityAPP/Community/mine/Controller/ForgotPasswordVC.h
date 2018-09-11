//
//  ForgotPasswordVC.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/7.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^ForgotPasswordCallback)(NSString * phone, NSString * password);
@interface ForgotPasswordVC : BaseViewController
    
@property(nonatomic,copy) ForgotPasswordCallback   callback;
    
+(void)pushToForgotPasswordViewController:(UIViewController *)controller callBack:(ForgotPasswordCallback )callback;

@end

