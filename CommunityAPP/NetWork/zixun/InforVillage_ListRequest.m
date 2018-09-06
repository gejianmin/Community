//
//  InforVillage_ListRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/16.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_ListRequest.h"
#import "InforVillage_ListResponse.h"

@implementation InforVillage_ListRequest
- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}
- (void)InforVillage_ListRequestWithCat_id:(NSString *)cat_id vid:(NSString *)vid page:(NSInteger)page{
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@/%ld/%@",self.hostString,InforVillage_List,cat_id,page,vid];
}
ResponserParserGenerate(InforVillage_ListResponse);

@end
