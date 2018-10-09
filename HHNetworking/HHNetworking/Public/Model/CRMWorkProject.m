//
//  CRMWorkProject.m
//  HHNetworking
//
//  Created by tongda ju on 2017/5/27.
//  Copyright © 2017年 HHAuto. All rights reserved.
//

#import "CRMWorkProject.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>


@implementation CRMWorkProject

@end

@implementation ClueModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"sourceId":@"id"};
}
+ (NSDictionary *)mj_objectClassInArray{
    
    return @{@"productList":[WorkProductModelCopy class]};
}

@end


@implementation WorkProductModelCopy

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ZDID":@"id"};
}

@end

@implementation WorkSelecteModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"Id":@"id"};
}
@end
@implementation InsertModel

- (NSString *)code{
    return @"";
}

- (NSString *)name{
    return @"全部";
}
@end
@implementation ClueListModel

+ (NSDictionary *)mj_objectClassInArray{
    
    return @{@"traceRecordFile":[ClueRraceRecordFile class]};
}
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"traceRecordId":@"id"};
}

@end
@implementation ClueRraceRecordFile

@end
