//
//  RequestBaseModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/8.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"

@implementation RequestBaseModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"code":@"error.status_code",
             @"status":@"status",
             @"message":@"error.message",
             };
}
@end
