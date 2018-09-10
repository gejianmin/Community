//
//  RegisterRequest.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/7.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface RegisterRequest : BaseRequest


/**
 获取验证码

 @param mobile 手机号（必选）
 */
- (void)setUserRegisterCodeWith:(NSString *)mobile;
/**
 注册接口
 @param mobile 手机号 （必选）
 @param code 短信验证码 （必选）
 @param password 密码 （必选）
 @param cpassword 确认密码 （必选）
 */
- (void)setUserRegisterWith:(NSString *)mobile code:(NSString *)code password:(NSString *)password cpassword:(NSString *)cpassword;
@end
