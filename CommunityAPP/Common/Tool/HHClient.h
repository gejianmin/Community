//
//  HHClient.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/11.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserObjModel;

@interface HHClient : NSObject
    
+ (instancetype)sharedInstance;
    
@property (nonatomic, strong) UserObjModel * user;//当前登录用户

-(BOOL)isLogin;
    
@end
