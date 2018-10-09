//
//  NearCommunityModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/11.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"

@interface CommunityModel : NSObject

@property (nonatomic, copy) NSString *vid;
@property (nonatomic, copy) NSString *org_id;
@property (nonatomic, copy) NSString *org_name;
@property (nonatomic, copy) NSString *address;

@end

@interface NearCommunityModel : RequestBaseModel

@property (nonatomic, copy) NSArray <CommunityModel *> *communityArray;

@end
///////////////////////////////////////
@interface GetCommunityModel : NSObject

@property (nonatomic, copy) NSString *vid;
@property (nonatomic, copy) NSString *org_name;
@property (nonatomic, copy) NSString *building;/** 楼号(String)*/
@property (nonatomic, copy) NSString *entrance;//单元号(String)
@property (nonatomic, copy) NSString *house_number;//门牌号

@end

@interface GetCommunityArrModel : RequestBaseModel

@property (nonatomic, copy) NSArray <GetCommunityModel *> *getCommunityArray;

@end


