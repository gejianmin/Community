//
//  InforVillage_ListRequest.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/16.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface InforVillage_ListRequest : BaseRequest

/**
 获取某文章分类下的文章列表

 @param cat_id 文章分类id
 @param vid 小区id
 @param page 页码
 */
- (void)InforVillage_ListRequestWithCat_id:(NSString *)cat_id vid:(NSString *)vid page:(NSInteger)page;

@end
