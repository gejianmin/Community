//
//  interactionDetailModel.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/17.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "interactionDetailModel.h"

@implementation interactionDetailModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"uid":@"user_info.uid",
             @"face":@"user_info.face",
             @"nickname":@"user_info.nickname",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"images" : [interactionDetailImageModel class]};
}
@end

@implementation interactionDetailImageModel
@end

