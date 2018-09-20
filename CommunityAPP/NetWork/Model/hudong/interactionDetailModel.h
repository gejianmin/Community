//
//  interactionDetailModel.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/17.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"

@interface interactionDetailImageModel : NSObject

@property (nonatomic, copy) NSString *img_file;
@property (nonatomic, copy) NSString *img_path;
@property (nonatomic, copy) NSString *img_src;
@property (nonatomic, copy) NSString *pid;

@end


@interface interactionDetailModel : RequestBaseModel

@property (nonatomic, copy) NSString * comments;
@property (nonatomic, copy) NSString * create_time;
@property (nonatomic, copy) NSString * favorites;
@property (nonatomic, copy) NSString * p_title;
@property (nonatomic, copy) NSString * face;/** icon*/
@property (nonatomic, copy) NSString * nickname;/** 昵称*/
@property (nonatomic, copy) NSString * uid;/** 用户ID*/
@property (nonatomic, copy) NSString * pid;/** 用户ID*/


@property (nonatomic, copy) NSString *views;
@property (nonatomic, copy) NSArray <interactionDetailImageModel *> *images;

@end
