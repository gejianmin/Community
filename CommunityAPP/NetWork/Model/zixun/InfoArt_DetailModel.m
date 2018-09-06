//
//  InfoArt_ListModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InfoArt_DetailModel.h"

@implementation InfoArt_DetailModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"article_id":@"data.article_id",
             @"org_id":@"data.org_id",
             @"cat_id":@"data.cat_id",
             @"title":@"data.title",
             @"thumb":@"data.thumb",
             @"desc":@"data.desc",
             @"views":@"data.views",
             @"favorites":@"data.favorites",
             @"allow_comment":@"data.allow_comment",
             @"comments":@"data.comments",
             @"shareurl":@"data.shareurl",
             @"ontime":@"data.ontime",
             @"status":@"data.status",
             @"orderby":@"data.orderby",
             @"is_del":@"data.is_del",
             @"creater":@"data.creater",
             @"create_time":@"data.create_time",
             @"update_time":@"data.update_time",
             @"path":@"data.path",
             @"filename":@"data.filename",
             @"content":@"data.content.content",

             };
}
@end
