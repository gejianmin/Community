//
//  Inter_categaryRequest.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/20.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface Inter_categaryRequest : BaseRequest

/**
 获取某帖子分类的所有子类列表
 
 @param cat_id 帖子分类
 */
- (void)InfoArt_categaryRequestWithCat_ID:(NSString *)cat_id;

/**
 获取某帖子分类的所有子类头部信息
 
 @param linkUrl 帖子分类
 */
- (void)InfoArt_categaryRequestWithLinkUrl:(NSString *)linkUrl;

@end
