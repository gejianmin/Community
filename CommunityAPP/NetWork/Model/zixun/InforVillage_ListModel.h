//
//  InforVillage_ListModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/16.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"
#import "InforVillage_ArticleCateModel.h"

@interface InforVillage_ListModel : RequestBaseModel

@property (nonatomic, copy) NSString *total;
@property (nonatomic, copy) NSArray <Village_ArticleListModel *> *list;
@end
