//
//  InfoArt_categaryRequest.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface InfoArt_categaryRequest : BaseRequest

/**
 获取某文章分类的所有子类列表
 
 @param cat_id 文章分类
 */
- (void)InfoArt_categaryRequestWithCat_ID:(NSString *)cat_id;

@end
