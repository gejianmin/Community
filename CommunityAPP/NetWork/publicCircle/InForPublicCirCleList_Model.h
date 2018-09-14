//
//  InForPublicCirCleList_Model.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/12.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"


@interface InForPublicCirCleList_Model : RequestBaseModel

@property (nonatomic, copy) NSString *p_id;//文章分类id
@property (nonatomic, copy) NSString *logo;//分类名称
@property (nonatomic, copy) NSString *title;//分类层级
@property (nonatomic, copy) NSString *url;//来源
@property (nonatomic, copy) NSString *is_del;//是否删除

@end
