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
