//
//  InterCarouseRequest.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface InterCarouseRequest : BaseRequest


/**
 互动轮播图

 @param ID 小区ID
 */
- (void)interCarouseRequestWithID:(NSString *)ID;

@end
