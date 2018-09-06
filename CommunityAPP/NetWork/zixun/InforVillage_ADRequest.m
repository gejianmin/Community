//
//  InforVillage_ADRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_ADRequest.h"
#import "InforVillage_ADResponse.h"

@implementation InforVillage_ADRequest
- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}
- (void)InforVillage_ADRequestWithID:(NSString *)ID{
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,InforVillage_AD,ID];
}
ResponserParserGenerate(InforVillage_ADResponse);

@end
