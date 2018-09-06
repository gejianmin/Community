//
//  InterPostListRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterPostListRequest.h"
#import "InterPostListResponse.h"

@implementation InterPostListRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}
- (void)interPostListRequestWithTopic_id:(NSString *)topic_id page:(NSInteger)page{
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@/%ld/%@",self.hostString,inter_postList,page,topic_id];
}
ResponserParserGenerate(InterPostListResponse);

@end
