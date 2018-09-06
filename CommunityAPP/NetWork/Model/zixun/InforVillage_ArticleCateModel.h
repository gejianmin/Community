//
//  InforVillage_ArticleCateModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"

@interface Village_ArticleListModel : NSObject

@property (nonatomic, copy) NSString *article_id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *filename;
@property (nonatomic, copy) NSString *views;
@property (nonatomic, copy) NSString *favorites;
@property (nonatomic, copy) NSString *allow_comment;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *create_time;

@end

@interface Village_ArticleCateModel : NSObject

@property (nonatomic, copy) NSString *cat_id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *total;
@property (nonatomic, copy) NSArray <Village_ArticleListModel *> *article_list;
@end


@interface InforVillage_ArticleCateModel : RequestBaseModel
@property (nonatomic, copy) NSArray <Village_ArticleCateModel *> *Village_ArticleCateArray;

@end
