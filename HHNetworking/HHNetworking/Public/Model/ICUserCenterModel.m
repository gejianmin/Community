//
//  ICUserCenterModel.m
//  HHNetworking
//
//  Created by tongda ju on 2017/11/16.
//  Copyright © 2017年 HHAuto. All rights reserved.
//

#import "ICUserCenterModel.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@implementation ICUserCenterModel

@end

@implementation ICMyGoldModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"goldCount":@"id"};
}
@end

@implementation ICMyOrderModel

@end

@implementation ICMyPrizeModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"myPrizeId":@"id"};
}
@end
