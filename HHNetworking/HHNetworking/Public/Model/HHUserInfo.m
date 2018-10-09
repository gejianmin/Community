//
//  HHUserInfo.m
//  HHNetworking
//
//  Created by qiangge on 2016/11/4.
//  Copyright © 2016年 HHAuto. All rights reserved.
//

#import "HHUserInfo.h"
#import <objc/runtime.h>
#import "HHInterface.h"

NSString * const HHUserInfoWithImg = @"HHUserInfoWithImg";

@implementation HHUserInfo
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        kFastDecode
        
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    kFastEncode
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID" : @"id"};
}

//- (NSString *)userId {
//    if (!_userId) {
//        _userId  = @"";
//    }
//    return _userId;
//}
//
//#pragma mark  -- 以下操作：特殊字段做本地存储
///*!< 昵称*/




@end


@implementation HHMessageStatus

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        kFastDecode
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    kFastEncode
}

- (BOOL)isRead {
    return [@"2" isEqualToString:self.status] ? NO : YES;
    
}

@end
@implementation HHUserLabel


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        kFastDecode
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    kFastEncode
}

@end

@implementation HHIDCard

@end
@implementation HHIDCardLegality
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"IDPhoto":@"ID Photo",@"TemporaryIDPhoto":@"Temporary ID Photo"};
}

@end
@implementation HHIDCardBirthday


@end

