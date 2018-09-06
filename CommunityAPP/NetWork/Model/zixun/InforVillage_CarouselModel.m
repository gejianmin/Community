//
//  InforVillage_CarouselModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_CarouselModel.h"

@implementation InforVillage_CarouselModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"Village_CarouselArray":@"data",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"Village_CarouselArray" : [Village_CarouselModel class]};
}
@end
@implementation Village_CarouselModel
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
