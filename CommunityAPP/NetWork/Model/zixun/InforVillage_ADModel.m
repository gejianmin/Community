//
//  InforVillage_ADModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_ADModel.h"

@implementation InforVillage_ADModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"Village_ADArray":@"data",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"Village_ADArray" : [Village_ADModel class]};
}
@end
@implementation Village_ADModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"ad_id":@"ad_id",
             @"adp_id":@"adp_id",
             @"ad_name":@"ad_name",
             @"ad_thumb":@"ad_thumb",
             @"link_url":@"link_url",
             @"vid":@"vid",
             @"start_time":@"start_time",
             @"end_time":@"end_time",
             @"is_del":@"is_del",
             
             };
}
@end

