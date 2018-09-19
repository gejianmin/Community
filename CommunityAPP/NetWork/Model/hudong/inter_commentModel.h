//
//  inter_commentModel.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/18.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"


@interface inter_commentCellModel : NSObject

@property (nonatomic, strong) NSMutableArray <inter_commentCellModel *> * children;/** 评论模型*/
@property (nonatomic, copy) NSString * cid;/** 评论ID*/
@property (nonatomic, copy) NSString * comment;/** 评论内容*/
@property (nonatomic, copy) NSString * create_time;/** 创建时间*/
@property (nonatomic, copy) NSString * parent_id;/** 上一级ID*/
@property (nonatomic, copy) NSString * tuid;/** 要评论用户ID*/
@property (nonatomic, copy) NSString * uid;/** 用户ID*/
@property (nonatomic, copy) NSString * userFace;/** icon*/
@property (nonatomic, copy) NSString * userNickname;/** 昵称*/
@property (nonatomic, copy) NSString * userUid;/** 用户ID*/
@property (nonatomic, copy) NSString * toFace;/** toicon*/
@property (nonatomic, copy) NSString * toNickname;/** to昵称*/
@property (nonatomic, copy) NSString * toUid;/** to用户ID*/
@property (nonatomic, strong) NSString * cellType;/** cell类型*/

@end

@interface inter_commentModel : RequestBaseModel

@property (nonatomic, strong) NSMutableArray <inter_commentCellModel *> *data;


@end
