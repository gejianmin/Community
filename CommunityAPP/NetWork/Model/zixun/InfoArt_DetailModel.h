//
//  InfoArt_ListModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"

@interface InfoArt_DetailModel : RequestBaseModel
@property (nonatomic, copy) NSString *article_id;
@property (nonatomic, copy) NSString *org_id;
@property (nonatomic, copy) NSString *cat_id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *views;
@property (nonatomic, copy) NSString *favorites;
@property (nonatomic, copy) NSString *allow_comment;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *shareurl;
@property (nonatomic, copy) NSString *ontime;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *orderby;
@property (nonatomic, copy) NSString *is_del;
@property (nonatomic, copy) NSString *creater;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *update_time;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *filename;
@property (nonatomic, copy) NSString *content;

@end
