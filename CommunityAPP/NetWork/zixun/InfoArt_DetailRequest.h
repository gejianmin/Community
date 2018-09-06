//
//  InfoArt_ListRequest.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface InfoArt_DetailRequest : BaseRequest

/**
 获取文章详情

 @param cat_id 文章ID
 */
- (void)infoArt_DetailRequestWithCat_ID:(NSString *)cat_id;
@end
