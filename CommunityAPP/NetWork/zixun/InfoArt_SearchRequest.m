//
//  InfoArt_SearchRequest.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/13.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "InfoArt_SearchRequest.h"
#import "InfoArt_SearchResponse.h"
@implementation InfoArt_SearchRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"POST";
    }
    return self;
}
- (void)interPostSearchRequestWithContent:(NSString *)content {
    
    //请求头
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    [self.headerFields setObject:@"account" forKey:@"loginway"];
    
    //请求参数
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setValue:content forKey:@"query"];
    self.parameters = paramDic;//post参数
    
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,infoArt_search];
    NSLog(@"请求链接%@",self.urlPathString);

}
ResponserParserGenerate(InfoArt_SearchResponse);

@end
