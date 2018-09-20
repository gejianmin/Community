//
//  inter_commentModel.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/18.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "inter_commentModel.h"


@implementation inter_commentModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"data":@"data",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [inter_commentCellModel class],
             @"children" : [inter_commentCellModel class]
             };
}

@end

@implementation inter_commentCellModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"userUid":@"user_info.uid",
             @"userFace":@"user_info.face",
             @"userNickname":@"user_info.nickname",
             @"toUid":@"touser_info.uid",
             @"toFace":@"touser_info.face",
             @"toNickname":@"touser_info.nickname",
             };
}
@end
@implementation inter_replayCommentModel

@end
