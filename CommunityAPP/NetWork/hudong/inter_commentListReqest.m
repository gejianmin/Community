//
//  inter_commentListReqest.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/18.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "inter_commentListReqest.h"
#import "inter_commentResponse.h"
@implementation inter_commentListReqest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}


- (void)interCommentListRequestWithID:(NSString *)ID{
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,inter_getComment,ID];
}
    
ResponserParserGenerate(inter_commentResponse);


@end

@implementation inter_replayCommentListReqest
- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"POST";
    }
    return self;
}
- (void)interReplayCommentListRequestWithID:(NSString *)ID comment:(NSString *)comment commentUrl:(NSString *)commentUrl{
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    [self.headerFields setObject:[[[HHClient sharedInstance]user]token] forKey:@"authorization"];

        NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
        [paramDic setValue:comment forKey:@"comment"];
        self.parameters = paramDic;//post参数
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,commentUrl,ID];
    
    
}
ResponserParserGenerate(inter_replayCommentResponse);

@end
