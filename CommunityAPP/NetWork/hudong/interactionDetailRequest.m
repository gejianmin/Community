//
//  interactionDetailRequest.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/17.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "interactionDetailRequest.h"
#import "interactionDetailResponse.h"
@implementation interactionDetailRequest
- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}

- (void)interactionDetailRequestWithID:(NSString *)ID{
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,inter_activeDetail,ID];
}
ResponserParserGenerate(interactionDetailResponse);

@end
