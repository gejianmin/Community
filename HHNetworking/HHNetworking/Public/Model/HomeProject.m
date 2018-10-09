//
//  HomeProject.m
//  CRMSystemClient
//
//  Created by tongda ju on 2017/5/22.
//  Copyright © 2017年 juTongDa. All rights reserved.
//

#import "HomeProject.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
@implementation HomeProject

@end


#pragma mark - ***************首页*****************
@implementation PerformanceTarget

@end
@implementation SalesStatistics

@end
@implementation AssessmentTargetDataList

@end
@implementation IdentifierDataList

@end
@implementation TimeScopeDataList

@end


#pragma mark - ***************搜索*****************
@implementation BusinessJsonArray

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"sourceId":@"id"};
}

@end

@implementation ClueJsonArray

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"sourceId":@"id"};
}

@end

@implementation ContactsJsonArray

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"sourceId":@"id"};
}

@end

@implementation CustomerJsonArray

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"sourceId":@"id"};
}

@end
