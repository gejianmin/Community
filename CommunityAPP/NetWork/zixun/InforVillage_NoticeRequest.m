//
//  InforVillage_NoticeRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_NoticeRequest.h"
#import "InforVillage_NoticeResponse.h"

@implementation InforVillage_NoticeRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}
- (void)InforVillage_NoticeRequest{
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,InforVillage_Notice];
}
ResponserParserGenerate(InforVillage_NoticeResponse);
@end
