//
//  InfoArt_ShareAddRequest.h
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/13.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface InfoArt_ShareAddRequest : BaseRequest
/**
 封装请求
 
 @param articleId 文章ID
 */
- (void)shareCountAddOnce:(NSString *)articleId;
@end
