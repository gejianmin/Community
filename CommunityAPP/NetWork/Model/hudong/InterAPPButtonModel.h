//
//  InterAPPButtonModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"
#import "InforVillage_AppButtonModel.h"

@interface InterAPPButtonModel : RequestBaseModel

@property (nonatomic, copy) NSArray <Village_AppButtonModel *> *Village_ModelArray;

@end
