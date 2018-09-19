//
//  interactionDetailRequest.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/17.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface interactionDetailRequest : BaseRequest

/**
 获取某小区互动页面的app按钮
 
 @param ID 帖子ID
 */
- (void)interactionDetailRequestWithID:(NSString *)ID;

@end
