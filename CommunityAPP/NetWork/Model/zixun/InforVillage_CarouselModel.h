//
//  InforVillage_CarouselModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"

@interface Village_CarouselModel : NSObject

@property (nonatomic, copy) NSString *ad_id;
@property (nonatomic, copy) NSString *adp_id;
@property (nonatomic, copy) NSString *ad_name;
@property (nonatomic, copy) NSString *ad_thumb;
@property (nonatomic, copy) NSString *link_url;
@property (nonatomic, copy) NSString *vid;
@property (nonatomic, copy) NSString *start_time;
@property (nonatomic, copy) NSString *end_time;
@property (nonatomic, copy) NSString *is_del;

@end
@interface InforVillage_CarouselModel : RequestBaseModel
@property (nonatomic, copy) NSArray <Village_CarouselModel *> *Village_CarouselArray;

@end
