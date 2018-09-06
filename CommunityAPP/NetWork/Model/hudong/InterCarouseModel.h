//
//  InterCarouseModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"
#import "InforVillage_CarouselModel.h"

@interface InterCarouseModel : RequestBaseModel
@property (nonatomic, copy) NSArray <Village_CarouselModel *> *data;

@end
