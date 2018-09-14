//
//  publicCircleList_Request.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/12.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "publicCircleList_Request.h"
#import "publicCircleList_Response.h"
@implementation publicCircleList_Request
    

    - (instancetype)init{
        if (self = [super init]) {
            
            self.httpMethod = @"GET";
        }
        return self;
    }
    
- (void)publicCircleList_sourceRequest{
//    self.headerFields = [NSMutableDictionary dictionary];
//    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",@"http://shopapi.sinoyjlm.com/",publicCircleList];
}
    
ResponserParserGenerate(publicCircleList_Response);
@end
