//
//  NSObject+SafeData.m
//  


#import "NSDictionary+SafeData.h"

@implementation NSDictionary(SafeData)


- (id)objectSafeForKey:(NSString*)key
{
    id object = nil;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    return object;
}
- (NSArray*)arraySafeForKey:(NSString*)key
{
    id object = nil;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    if(![object isKindOfClass:[NSArray class]]){
        object = nil;
    }
    return object;
}
- (NSDictionary*)dictionarySafeForKey:(NSString*)key
{
    id object = nil;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    if(![object isKindOfClass:[NSDictionary class]]){
        object = nil;
    }
    return object;
}
- (NSString*)stringSafeForKey:(NSString*)key
{
    id object = nil;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    
    
    if([object isKindOfClass:[NSNumber class]]){
        
        NSNumber*number = (NSNumber*)object;
        object = [number stringValue];
    }
    
    if(![object isKindOfClass:[NSString class]] && ![object isKindOfClass:[NSNumber class]]){
        object = nil;
    }
    return object;
}
- (NSMutableArray*)mutableArraySafeForKey:(NSString*)key
{
    id object = nil;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    if(![object isKindOfClass:[NSMutableArray class]]){
        object = nil;
    }
    return object;
}
- (NSMutableDictionary*)mutableDictionarySafeForKey:(NSString*)key
{
    id object = nil;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    if(![object isKindOfClass:[NSMutableDictionary class]]){
        object = nil;
    }
    return object;
}
- (NSInteger)integerSafeForKey:(NSString*)key
{
    id object = nil;
    NSInteger num = 0;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    if([object respondsToSelector:@selector(integerValue)]){
        num = [object integerValue];
    }
    return num;
}
- (CGFloat)floatSafeForKey:(NSString*)key
{
    id object = nil;
    CGFloat num = 0;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    if([object respondsToSelector:@selector(floatValue)]){
        num = [object floatValue];
    }
    return num;
}
- (int)intSafeForKey:(NSString*)key
{
    id object = nil;
    int num = -1;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    if([object respondsToSelector:@selector(intValue)]){
        num = [object intValue];
    }
    return num;
}

- (NSNumber*)numberSafeForKey:(NSString*)key
{
    id object = nil;
    NSNumber* num = nil;
    if([self respondsToSelector:@selector(objectForKey:)] && key){
        object = [self objectForKey:key];
    }
    if([object isKindOfClass:[NSNumber class]]){
        
        num = (NSNumber*)object;
    }
    
    return num;
}
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableLeaves
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
