//
//  LoginModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/9.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"uid":@"data.uid",
             @"mobile":@"data.mobile",
             @"nickname":@"data.nickname",
             @"face":@"data.face",
             @"money":@"data.money",
             @"coin":@"data.coin",
             @"jifen":@"data.jifen",
             @"token":@"data.token",
             };
}
@end
