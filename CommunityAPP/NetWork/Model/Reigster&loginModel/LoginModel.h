//
//  LoginModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/9.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"

@interface LoginModel : RequestBaseModel

@property (nonatomic,copy) NSString * uid;
@property (nonatomic,copy) NSString * mobile;
@property (nonatomic,copy) NSString * nickname;
@property (nonatomic,copy) NSString * face;
@property (nonatomic,copy) NSString * money;
@property (nonatomic,copy) NSString * coin;
@property (nonatomic,copy) NSString * jifen;
@property (nonatomic,copy) NSString * token;
@end
