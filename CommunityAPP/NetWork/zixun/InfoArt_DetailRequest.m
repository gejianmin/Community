//
//  InfoArt_ListRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InfoArt_DetailRequest.h"
#import "InfoArt_DetailResponse.h"

@implementation InfoArt_DetailRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}
- (void)infoArt_DetailRequestWithCat_ID:(NSString *)cat_id{
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];

    
    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,infoArt_articles,cat_id];
}
ResponserParserGenerate(InfoArt_DetailResponse)
@end
