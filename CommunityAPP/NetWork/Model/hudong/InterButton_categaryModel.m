//
//  InterButton_categaryModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/20.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterButton_categaryModel.h"

@implementation InterButton_categaryModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"data":@"data",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [Inter_categaryModel class]};
}
@end
@implementation Inter_categaryModel

@end
