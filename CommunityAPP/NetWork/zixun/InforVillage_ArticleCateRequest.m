//
//  InforVillage_ArticleCateRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_ArticleCateRequest.h"
#import "InforVillage_ArticleCateResponse.h"

@implementation InforVillage_ArticleCateRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}
- (void)InforVillage_ArticleCateRequestWithID:(NSString *)ID{
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,InforVillage_ArticleCate,ID];
}
ResponserParserGenerate(InforVillage_ArticleCateResponse);
@end
