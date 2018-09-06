//
//  InterPostListModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterPostListModel.h"

@implementation InterPostListModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"list":@"data.list",
             @"total":@"data.total",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [PostListModel class]};
}
@end
@implementation PostListModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"images":@"images",
             @"face":@"user_info.face",
             @"nickname":@"user_info.nickname",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"images" : [PostImagesListModel class]};
}
@end
@implementation PostImagesListModel
@end
