//
//  nearCommunityRequest.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/11.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface NearCommunityRequest : BaseRequest

/**
 获取离你附近最近的三个社区
 
 @param lat 经度
 @param lng 维度
 */
- (void)setNearVillageWithlat:(CGFloat)lat lng:(CGFloat)lng;
@end
