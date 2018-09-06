//
//  InterTopicListRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterTopicListRequest.h"
#import "InterTopicListResponse.h"

@implementation InterTopicListRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}
- (void)interTopicListRequestWithID{
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,inter_topics];
}
ResponserParserGenerate(InterTopicListResponse);

@end
