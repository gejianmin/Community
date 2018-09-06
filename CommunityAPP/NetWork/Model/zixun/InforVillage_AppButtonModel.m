//
//  InforVillage_AppButtonModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_AppButtonModel.h"

@implementation InforVillage_AppButtonModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"Village_ModelArray":@"data",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"Village_ModelArray" : [Village_AppButtonModel class]};
}
@end
@implementation Village_AppButtonModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"title":@"title",
             @"linkurl":@"linkurl",
             @"thumb":@"thumb",
             @"jump_type":@"jump_type",
             @"sort":@"sort",

             };
}
@end
