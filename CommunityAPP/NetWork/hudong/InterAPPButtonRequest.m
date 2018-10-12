//
//  InterAPPButtonRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterAPPButtonRequest.h"
#import "InterAPPButtonResponse.h"

@implementation InterAPPButtonRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}

- (void)interAPPButtonRequestWithID:(NSString *)ID{
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];

    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,inter_FourmBtn,ID];
}
ResponserParserGenerate(InterAPPButtonResponse);


@end
