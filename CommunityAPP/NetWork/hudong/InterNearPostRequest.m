//
//  InterNearPostRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterNearPostRequest.h"
#import "InterNearPostResponse.h"

@implementation InterNearPostRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"POST";
    }
    return self;
}
- (void)interPostListRequestWithTopic_id:(NSString *)topic_id page:(NSInteger)page lng:(float)lng lat:(float)lat miters:(int)miters{
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setValue:topic_id forKey:@"topic_id"];
    [paramDic setValue:[NSNumber numberWithInteger:page] forKey:@"page"];
    [paramDic setValue:[NSNumber numberWithInt:miters] forKey:@"miters"];
    [paramDic setValue:[NSNumber numberWithFloat:lng] forKey:@"lng"];
    [paramDic setValue:[NSNumber numberWithFloat:lat] forKey:@"lat"];

    self.parameters = paramDic;//post参数
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,inter_NearPostList];
}
ResponserParserGenerate(InterNearPostResponse);

@end
