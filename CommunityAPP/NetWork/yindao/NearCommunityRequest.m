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


@implementation PubCommunityRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"POST";
    }
    return self;
}
- (void)enterCommunityWithInfo:(NSDictionary *)dictionary{
    

    self.parameters = dictionary;//post参数
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    [self.headerFields setObject:[[[HHClient sharedInstance]user]token] forKey:@"authorization"];

    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,inter_createCommunity];
}
ResponserParserGenerate(PubCommunityResponse);

@end
@implementation GetCommunityRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}
- (void)getCommunityListWithId:(NSString *)uid{
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    [self.headerFields setObject:[[[HHClient sharedInstance]user]token] forKey:@"authorization"];    
    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,inter_getYezhuByMember,uid];
}
ResponserParserGenerate(GetCommunityResponse);

@end

@implementation PublicCommunityRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"POST";
    }
    return self;
}
- (void)publicCommunityWithInfo:(NSDictionary *)dictionary{
    
    self.parameters = dictionary;//post参数
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    [self.headerFields setObject:[[[HHClient sharedInstance]user]token] forKey:@"authorization"];
    
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,inter_publicCommunity];
}
ResponserParserGenerate(PublicCommunityResponse);

@end





