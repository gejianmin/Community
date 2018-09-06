//
//  InterPostListRequest.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface InterPostListRequest : BaseRequest

/**
 获取某话题下的帖子列表

 @param topic_id 话题分类
 @param page 页码
 */
- (void)interPostListRequestWithTopic_id:(NSString *)topic_id page:(NSInteger)page;
@end
