//
//  InfoArt_categaryRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InfoArt_categaryRequest.h"
#import "InfoArt_categaryResponse.h"

@implementation InfoArt_categaryRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}
- (void)InfoArt_categaryRequestWithCat_ID:(NSString *)cat_id{
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
//    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
//    [paramDic setValue:cat_id forKey:@"id"];
//    self.parameters = paramDic;//post参数
    
//    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,infoArt_categray,cat_id];
    if ([cat_id containsString:@"http://"]) {
        self.urlPathString = cat_id;
    }else{
        self.urlPathString = [NSString stringWithFormat:@"http://%@",cat_id];
    }

}
ResponserParserGenerate(InfoArt_categaryResponse)
@end
