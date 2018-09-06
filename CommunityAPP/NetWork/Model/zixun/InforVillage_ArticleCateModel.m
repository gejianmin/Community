//
//  InforVillage_ArticleCateModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_ArticleCateModel.h"

@implementation InforVillage_ArticleCateModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"Village_ArticleCateArray":@"data",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"Village_ArticleCateArray" : [Village_ArticleCateModel class]};
}
@end
@implementation Village_ArticleCateModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"total":@"article_list.total",
             @"article_list":@"article_list.list",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"article_list" : [Village_ArticleListModel class]};
}
@end
@implementation Village_ArticleListModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"filename":@"thumb.thumb_info.filename",
             @"path":@"thumb.thumb_info.path",
             };
}
@end
