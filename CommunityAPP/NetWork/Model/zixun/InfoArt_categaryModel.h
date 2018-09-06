//
//  InfoArt_categaryModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"

@interface Art_categaryModel : NSObject
@property (nonatomic, copy) NSString *cat_id;//文章分类id
@property (nonatomic, copy) NSString *parent_id;//文章分类父id
@property (nonatomic, copy) NSString *title;//分类名称
@property (nonatomic, copy) NSString *level;//分类层级
@property (nonatomic, copy) NSString *from;//来源
@property (nonatomic, copy) NSString *orderby;//文章分类排序
@property (nonatomic, copy) NSString *hidden;//是否隐藏
@property (nonatomic, copy) NSString *create_time;//创建时间
@property (nonatomic, copy) NSString *is_del;//是否删除

@end

@interface InfoArt_categaryModel : RequestBaseModel

@property (nonatomic, copy) NSArray <Art_categaryModel *> *data;
@end
