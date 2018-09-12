
//
//  NearCommunityModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/11.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "NearCommunityModel.h"

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
@implementation NearCommunityModel

    -(instancetype)initWithCoder:(NSCoder *)aDecoder{
        if (self=[super init]) {
            kFastDecode
        }
        return self;
    }
-(void)encodeWithCoder:(NSCoder *)aCoder{
    kFastEncode
}
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"communityArray":@"data",
             };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"communityArray" : [CommunityModel class]};
}
@end

@implementation CommunityModel

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"vid":@"vid",
             @"org_id":@"org_id",
             @"org_name":@"org_name",
             @"address":@"address",
             };
}
@end
