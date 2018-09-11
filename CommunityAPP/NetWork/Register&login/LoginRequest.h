//
//  LoginRequest.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/9.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface LoginRequest : BaseRequest

/**
 用户登录
 @param mobile 手机号
 @param password 密码
 */
- (void)setUserLoignWith:(NSString *)mobile password:(NSString *)password;
    /**
     第三方用户登录
     @param open_id 手机号
     @param password 密码
     */
- (void)setUserLoignWithThirdOpen_id:(NSString *)open_id union_id:(NSString *)union_id;
@end
