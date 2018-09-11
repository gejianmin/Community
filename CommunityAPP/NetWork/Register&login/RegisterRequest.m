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
#pragma mark--注册
- (void)setUserRegisterWith:(NSString *)mobile code:(NSString *)code password:(NSString *)password cpassword:(NSString *)cpassword{
    
    //post参数
    NSString *key = [RSAEncryptor encryptString:password publicKey:RSA_Public_key];
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setValue:mobile forKey:@"mobile"];
    [paramDic setValue:code  forKey:@"code"];
    [paramDic setValue:key forKey:@"password"];
    [paramDic setValue:key forKey:@"cpassword"];
    self.parameters = paramDic;//post参数
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,Register];

}
#pragma mark--注册获取验证码
- (void)setUserRegisterCodeWith:(NSString *)mobile{
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setValue:mobile forKey:@"mobile"];
    self.parameters = paramDic;//post参数
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,registerCode];

}
#pragma mark--忘记密码获取验证码
- (void)setUserforgotPasswordGetCodeWith:(NSString *)mobile;{
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setValue:mobile forKey:@"mobile"];
    self.parameters = paramDic;//post参数
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,resetPasswd];
    
}
#pragma mark--忘记密码
- (void)setUserResetPasswordWith:(NSString *)mobile code:(NSString *)code password:(NSString *)password cpassword:(NSString *)cpassword{
    //post参数
    NSString *key = [RSAEncryptor encryptString:password publicKey:RSA_Public_key];
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setValue:mobile forKey:@"mobile"];
    [paramDic setValue:code  forKey:@"code"];
    [paramDic setValue:key forKey:@"password"];
    [paramDic setValue:key forKey:@"cpassword"];
    self.parameters = paramDic;//post参数
    self.headerFields = [NSMutableDictionary dictionary];
    [self.headerFields setObject:@"yezhu" forKey:@"identity"];
    
    self.urlPathString = [NSString stringWithFormat:@"%@%@",self.hostString,forgetPassword];
    
    
    
}
ResponserParserGenerate(RegisterResponse);

@end
