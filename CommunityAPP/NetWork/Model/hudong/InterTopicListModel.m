//
//  InterTopicListModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterTopicListModel.h"

@implementation InterTopicListModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"data":@"data",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [TopicListModel class]};
}
@end

@implementation TopicListModel
@end
