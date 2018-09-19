//
//  inter_commentListReqest.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/18.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface inter_commentListReqest : BaseRequest

/**
 获取评论列表
 
 @param ID 帖子ID
 */
- (void)interCommentListRequestWithID:(NSString *)ID;

@end
