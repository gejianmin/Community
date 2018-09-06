//
//  InterPostListModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"

@interface PostImagesListModel : NSObject

@property (nonatomic, copy) NSString *pid;
@property (nonatomic, copy) NSString *img_src;

@end

@interface PostListModel : NSObject

@property (nonatomic, copy) NSString *pid;
@property (nonatomic, copy) NSString *p_title;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSArray <PostImagesListModel *> *images;

@property (nonatomic, copy) NSString *face;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *favorites;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *views;

@end

@interface InterPostListModel : RequestBaseModel

@property (nonatomic, copy) NSArray <PostListModel *> *list;
@property (nonatomic, copy) NSString *total;

@end
