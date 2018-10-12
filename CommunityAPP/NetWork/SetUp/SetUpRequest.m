//
//  SetUpRequest.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/10/9.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SetUpRequest.h"
#import "SetUpResponse.h"
@implementation SetUpRequest
- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}
- (void)setupRequestData {
    
    //请求头
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    [self.headerFields setObject:[HHComlient sharedInstance].user.token forKey:@"authorization"];

    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,setUp_getPersonInfo];
}


ResponserParserGenerate(SetUpResponse);

@end
