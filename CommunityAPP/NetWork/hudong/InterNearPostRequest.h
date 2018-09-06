//
//  InterNearPostRequest.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface InterNearPostRequest : BaseRequest

/**
 根据距离获取附近帖子

 @param topic_id 话题id
 @param page 当前页
 @param lng 经度
 @param lat 纬度
 @param miters 距离(公里)
 */
- (void)interPostListRequestWithTopic_id:(NSString *)topic_id page:(NSInteger)page lng:(float)lng lat:(float)lat miters:(int)miters;

@end
