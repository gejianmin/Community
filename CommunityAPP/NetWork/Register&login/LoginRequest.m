//
//  LoginRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/9.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "LoginRequest.h"
#import "LoginResponse.h"
#import "RSAEncryptor.h"

@implementation LoginRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"POST";
    }
    return self;
}
- (void)setUserLoignWith:(NSString *)mobile password:(NSString *)password{
    
    //post参数
    
    NSString *key = [RSAEncryptor encryptString:@"111111" publicKey:RSA_Public_key];
    
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setValue:@"18510844448" forKey:@"account"];
    [paramDic setValue:key forKey:@"password"];
    self.parameters = paramDic;//post参数
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    [self.headerFields setObject:@"account" forKey:@"loginway"];

    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,Login];
}
ResponserParserGenerate(LoginResponse);

@end
