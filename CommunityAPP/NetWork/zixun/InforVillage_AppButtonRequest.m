//
//  InforVillage_AppButtonRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_AppButtonRequest.h"
#import "InforVillage_AppButtonResponse.h"

@implementation InforVillage_AppButtonRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}

- (void)InforVillage_AppButtonRequestWithID:(NSString *)ID{
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,InforVillage_AppButton,ID];
}
ResponserParserGenerate(InforVillage_AppButtonResponse);

@end
