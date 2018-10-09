//
//  Inter_categaryRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/20.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "Inter_categaryRequest.h"
#import "Inter_categaryResponse.h"

@implementation Inter_categaryRequest
- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"GET";
    }
    return self;
}
- (void)InfoArt_categaryRequestWithCat_ID:(NSString *)cat_id{
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    [self.headerFields setObject:[[[HHComlient sharedInstance]user]token] forKey:@"authorization"];

    //    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    //    [paramDic setValue:cat_id forKey:@"id"];
    //    self.parameters = paramDic;//post参数
    
    //    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,infoArt_categray,cat_id];
//    if ([cat_id containsString:@"http://"]) {
//        self.urlPathString = cat_id;
//    }else{
//        self.urlPathString = [NSString stringWithFormat:@"http://%@",cat_id];
        self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,inter_followTopic,cat_id];

//    }
    
}
- (void)InfoArt_categaryRequestWithLinkUrl:(NSString *)linkUrl{
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    [self.headerFields setObject:[[[HHComlient sharedInstance]user]token] forKey:@"authorization"];
    
    //    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    //    [paramDic setValue:cat_id forKey:@"id"];
    //    self.parameters = paramDic;//post参数
    
    //    self.urlPathString = [NSString stringWithFormat:@"%@%@/%@",self.hostString,infoArt_categray,cat_id];
    if ([linkUrl containsString:@"http://"]) {
        self.urlPathString = linkUrl;
    }else{
        self.urlPathString = [NSString stringWithFormat:@"http://%@",linkUrl];
    }
    
    
}
ResponserParserGenerate(Inter_categaryResponse)
@end
