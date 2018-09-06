//
//  InforVillage_carouselRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_CarouselRequest.h"
#import "InforVillage_CarouselResponse.h"

@implementation InforVillage_CarouselRequest
- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}
- (void)InforVillage_CarouselRequestWithID:(NSString *)ID{
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,InforVillage_Carousel,ID];
}
ResponserParserGenerate(InforVillage_CarouselResponse);

@end
