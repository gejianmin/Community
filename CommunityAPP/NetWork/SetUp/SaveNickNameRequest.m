//
//  SaveNickNameRequest.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/10/10.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SaveNickNameRequest.h"
#import "SaveNickNameRespose.h"
@implementation SaveNickNameRequest
- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)saveNickName:(NSString *)nickName {
    
    //请求头
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    [self.headerFields setObject:[HHComlient sharedInstance].user.token forKey:@"authorization"];
    //请求参数
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setValue:nickName forKey:@"nickname"];
    self.parameters = paramDic;//post参数
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,inter_peesoninfo];
}

ResponserParserGenerate(SaveNickNameRespose);

@end
