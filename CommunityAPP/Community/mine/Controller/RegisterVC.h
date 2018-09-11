//
//  RegisterVC.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/7.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^RegisterCallback)(NSString * phone, NSString * password);

@interface RegisterVC : BaseViewController
 @property(nonatomic,copy) RegisterCallback   callback;
    
+(void)pushToRegisterViewController:(UIViewController *)controller callBack:( RegisterCallback )callback;
@end
