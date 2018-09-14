//
//  InfoArt_ShareAddRequest.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/13.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "InfoArt_ShareAddRequest.h"
#import "InfoArt_ShareAddOnceResponse.h"
@implementation InfoArt_ShareAddRequest
- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)shareCountAddOnce:(NSString *)articleId {
    
    //请求头
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    //请求参数
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setValue:articleId forKey:@"query"];
    self.parameters = paramDic;//post参数
    
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,infoArt_shareCountAdd];
    
    
}
ResponserParserGenerate(InfoArt_ShareAddOnceResponse);
@end
