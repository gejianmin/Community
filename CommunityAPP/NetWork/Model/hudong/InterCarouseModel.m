//
//  InterCarouseModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterCarouseModel.h"

@implementation InterCarouseModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"data":@"data",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [Village_CarouselModel class]};
}
@end
