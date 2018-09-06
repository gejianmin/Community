//
//  InterTopicListModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"

@interface TopicListModel : NSObject

@property (nonatomic, copy) NSString *topic_id;//话题id
@property (nonatomic, copy) NSString *topic_name;//话题名称
@property (nonatomic, copy) NSString *topic_desc;//话题简介
@property (nonatomic, copy) NSString *is_del;

@end

@interface InterTopicListModel : RequestBaseModel

@property (nonatomic, copy) NSArray <TopicListModel *> *data;

@end
