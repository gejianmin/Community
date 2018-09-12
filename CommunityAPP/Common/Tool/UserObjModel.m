//
//  UserObjModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "UserObjModel.h"
#define kFastDecode u_int count=0;\
objc_property_t *properties=class_copyPropertyList([self class], &count);\
for (int i=0; i<count; i++) {\
const char* pname=property_getName(properties[i]);\
NSString *key=[NSString stringWithUTF8String:pname];\
id value=[aDecoder decodeObjectForKey:key];\
if (value) {\
[self setValue:value forKey:key];\
}\
}\
free(properties);

#define kFastEncode     u_int count=0;\
objc_property_t *properties=class_copyPropertyList([self class], &count);\
for (int i=0; i<count; i++) {\
const char* pname=property_getName(properties[i]);\
NSString *key=[NSString stringWithUTF8String:pname];\
id value=[self valueForKey:key];\
[aCoder encodeObject:value forKey:key];\
}\
free(properties);

static UserObjModel *userObj = nil;

@implementation UserObjModel
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
        if (self=[super init]) {
            kFastDecode
        }
        return self;
    }
-(void)encodeWithCoder:(NSCoder *)aCoder{
    kFastEncode
}
-(void)setOrg_id:(NSString *)org_id{
    _org_id = org_id;
   [[HHClient sharedInstance] setUser:self];
}
-(void)setVid:(NSString *)vid{
    _vid = vid;
    [[HHClient sharedInstance] setUser:self];
}
- (void)setOrg_name:(NSString *)org_name{
    _org_name = org_name;
    [[HHClient sharedInstance] setUser:self];
}
+ (instancetype)shareIntance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (userObj == nil) {
            userObj = [[UserObjModel alloc] init];
        }
    });
    return userObj;
}
- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}
    
@end

