//
//  RegisterRequest.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/7.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RegisterRequest.h"
#import "RegisterResponse.h"
#import "RSAEncryptor.h"

@implementation RegisterRequest

- (instancetype)init{
    if (self = [super init]) {
        
        self.httpMethod = @"POST";
    }
    return self;
}
- (void)setUserRegisterWith:(NSString *)mobile code:(NSString *)code password:(NSString *)password cpassword:(NSString *)cpassword{
    
    //post参数
    
    NSString *key = [RSAEncryptor encryptString:@"111111" publicKey:RSA_Public_key];
    
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setValue:@"18510844448" forKey:@"mobile"];
    [paramDic setValue:@"1234" forKey:@"code"];
    [paramDic setValue:key forKey:@"password"];
    [paramDic setValue:key forKey:@"cpassword"];
    self.parameters = paramDic;//post参数
    
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,Register];

}
ResponserParserGenerate(RegisterResponse);

@end
