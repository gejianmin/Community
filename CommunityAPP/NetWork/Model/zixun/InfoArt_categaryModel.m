//
//  InfoArt_categaryModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InfoArt_categaryModel.h"

@implementation InfoArt_categaryModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"data":@"data",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [Art_categaryModel class]};
}
@end
@implementation Art_categaryModel

@end
