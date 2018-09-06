
//
//  NearCommunityModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/11.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "NearCommunityModel.h"

@implementation NearCommunityModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"communityArray":@"data",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"communityArray" : [CommunityModel class]};
}
@end

@implementation CommunityModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"vid":@"vid",
             @"org_id":@"org_id",
             @"org_name":@"org_name",
             @"address":@"address",
             };
}
@end
