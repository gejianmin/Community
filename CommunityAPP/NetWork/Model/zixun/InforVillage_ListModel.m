//
//  InforVillage_ListModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/16.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_ListModel.h"

@implementation InforVillage_ListModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"list":@"data.list",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [Village_ArticleListModel class]};
}
@end

