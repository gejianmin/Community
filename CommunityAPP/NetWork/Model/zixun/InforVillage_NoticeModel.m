//
//  InforVillage_NoticeModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_NoticeModel.h"

@implementation InforVillage_NoticeModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"notice_title":@"data.notice_title",
             @"notice_content":@"data.notice_content",
             };
}
@end
