//
//  nearCommunityRequest.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/11.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"
#import "GSAPublishModel.h"

@class PubCommunityRequest,GetCommunityRequest,PublicCommunityRequest;

@interface NearCommunityRequest : BaseRequest

/**
 获取离你附近最近的三个社区
 
 @param lat 经度
 @param lng 维度
 */
- (void)setNearVillageWithlat:(CGFloat)lat lng:(CGFloat)lng;
@end


@interface PubCommunityRequest : BaseRequest


 /**
  入住小区申请
  *
  */
//@params vid             小区id(int)
//@params uid             当前id(int)
//@params building        楼号(String)
//@params entrance        单元号(String)
//@params house_number    门牌号
//@params floor_space     房屋面积 100
//@params have_parking    是否有停车位，是:１否:0 1
//@params parking_number  停车位编号 521S2
//@params plate_number     车牌号 12433
//@params contact          联系人
//@params mobile           联系电话

- (void)enterCommunityWithInfo:(NSDictionary *)dictionary;

@end

@interface GetCommunityRequest : BaseRequest

/**
 获取离你附近最近的三个社区
 @param uid 用户ID
 */
- (void)getCommunityListWithId:(NSString *)uid;

@end

//////////////////////////////////
@interface PublicCommunityRequest : BaseRequest


/**
 入住小区申请
 *
*/
// @params p_title    标题
// @params p_content  帖子内容
// @params lat        纬度
// @params lng        经度
// @params topic_id   话题id
// @params address    地址
// @params photos     上传图片的地址
// @params price      价格

- (void)publicCommunityWithInfo:(NSDictionary *)dictionary;

@end

