//
//  NSObject+SafeData.h
//  


#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@interface NSDictionary(SafeData)

- (id)objectSafeForKey:(NSString*)key;
- (NSArray*)arraySafeForKey:(NSString*)key;
- (NSDictionary*)dictionarySafeForKey:(NSString*)key;
- (NSString*)stringSafeForKey:(NSString*)key;
- (NSMutableArray*)mutableArraySafeForKey:(NSString*)key;
- (NSMutableDictionary*)mutableDictionarySafeForKey:(NSString*)key;
- (NSInteger)integerSafeForKey:(NSString*)key;
- (CGFloat)floatSafeForKey:(NSString*)key;
- (NSNumber*)numberSafeForKey:(NSString*)key;
- (int)intSafeForKey:(NSString*)key;

/**
 json字符串转字典

 @param jsonString json字符串
 @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
