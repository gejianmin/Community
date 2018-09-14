//
//  InForPublicCirCleList_Model.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/12.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "InForPublicCirCleList_Model.h"

@implementation InForPublicCirCleList_Model

+(NSDictionary *)modelCustomPropertyMapper{
    return @{
             @"title":@"title",
             @"p_id":@"id",
             @"is_del":@"is_del",
             @"logo":@"logo",
             @"url":@"url",
             
             };
}
@end

