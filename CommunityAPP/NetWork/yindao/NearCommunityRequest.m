//
//  nearCommunityRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/11.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "NearCommunityRequest.h"
#import "NearCommunityResponse.h"

@implementation NearCommunityRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"POST";
    }
    return self;
}
- (void)setNearVillageWithlat:(CGFloat)lat lng:(CGFloat)lng{
    
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setValue:[NSNumber numberWithFloat:lat] forKey:@"lat"];
    [paramDic setValue:[NSNumber numberWithFloat:lng] forKey:@"lng"];
    self.parameters = paramDic;//post参数
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,NearVillage];
}
ResponserParserGenerate(NearCommunityResponse);

@end
