//
//  InfoArt_SearchRequest.h
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/13.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface InfoArt_SearchRequest : BaseRequest


/**
 封装请求

 @param content 搜索内容
 */
- (void)interPostSearchRequestWithContent:(NSString *)content;

@end
