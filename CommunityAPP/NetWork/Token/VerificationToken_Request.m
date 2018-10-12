//
//  VerificationToken_Request.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/10/10.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "VerificationToken_Request.h"
#import "VerificationToken_Response.h"
@implementation VerificationToken_Request
- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)verificationTokenWithToken:(NSString *)token{
    self.headerFields = [NSMutableDictionary dictionary];
    HHLog(@"toekn ==%@",[[[HHComlient sharedInstance]user]token]);
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    [self.headerFields setObject:token forKey:@"authorization"];
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,VerificationToken];
}
ResponserParserGenerate(VerificationToken_Response);

@end
