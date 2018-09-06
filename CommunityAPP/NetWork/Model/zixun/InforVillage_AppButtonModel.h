//
//  InforVillage_AppButtonModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"

@interface Village_AppButtonModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *linkurl;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *jump_type;
@property (nonatomic, copy) NSString *sort;

@end
@interface InforVillage_AppButtonModel : RequestBaseModel

@property (nonatomic, copy) NSArray <Village_AppButtonModel *> *Village_ModelArray;

@end
