//
//  BaseRequest.m
//  55BBS
//
//  Created by KepenJ on 2017/2/24.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"
#import "NSString+Helper.h"
#import "BaseResponse.h"

@implementation BaseRequest

- (instancetype)init{
    if (self = [super init]) {
        
        _httpsManager= [[AFHTTPSessionManager  manager] initWithBaseURL:[NSURL URLWithString:URI_MAIN]];

        //cer认证
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
        securityPolicy.allowInvalidCertificates = YES;
        // /先导入证书
//        NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"HTTPS证书" ofType:@"cer"];//证书的路径
//        NSData *certData = [NSData dataWithContentsOfFile:cerPath];
        _httpsManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//        [securityPolicy setAllowInvalidCertificates:YES];

//        securityPolicy.validatesDomainName = YES;
//        securityPolicy.pinnedCertificates = [NSSet setWithObjects:certData, nil];
//        _httpsManager.securityPolicy = securityPolicy;

    }
    return self;
}
- (void)setFinishedBlock:(BBSRequestFinishedBlock)finishedBlock failedBlock:(BBSRequestFailedBlock)failedBlock{
    
    self.finishedBlock = finishedBlock;
    self.failedBlock = failedBlock;
    //设置超时时间
    _httpsManager.requestSerializer.timeoutInterval = self.timeoutInterval;
    //解析类型
    _httpsManager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
//    _httpsManager.responseSerializer = [AFHTTPResponseSerializer serializer];

    //添加头部信息
    if (self.headerFields) {
        for (NSString *key in [self.headerFields allKeys]) {
            NSString *value = [self.headerFields objectForKey:key];
            [_httpsManager.requestSerializer setValue:value forHTTPHeaderField:key];
        }
    }
    __weak typeof(self) weakSelf = self;
    if ([self.httpMethod isEqualToString:@"GET"]) {
        
//        NSURLSessionDataTask * dataTask =
        [_httpsManager GET:self.urlPathString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //请求成功回
//            NSString *funcType = task.taskDescription;
            [self parseBackJSONData:responseObject];

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSString *funcType = task.taskDescription;
            [weakSelf doParseError:[error code]];
        }];
        
    }else{
        //发起POST请求
//        NSURLSessionDataTask * dataTask =
        [_httpsManager POST:self.urlPathString parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                
                DLog(@"1");
                
            }else{
                DLog(@"2");
            }
            [self parseBackJSONData:responseObject];

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"%@",error.localizedDescription);
            [weakSelf doParseError:[error code]];
            
        }];
    }
}
//解析方法
-(void)parseBackJSONData:(NSDictionary *)jsonData{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{//若解析量很大，则开启此线程

        [[self responseParser] setResponseData:jsonData];//数据赋值
        if (![jsonData isKindOfClass:[NSDictionary class]])//容错处理，类型不对PASS掉
        {
            [weakSelf doParseError:NETWORK_ERROR_FORMAT];//格式不正确
        }
        
        else
        {
            [[self responseParser] parseBackData];
//            id code = [((NSDictionary *)jsonData) objectForKey:@"code"];
//            if ([code isKindOfClass:[NSString class]]) {
//                if ([code isEqualToString:@"0"]) {
//                    [weakSelf doParseError:NETWORK_ERROR_DATA];//格式不正确
//                }else{
//                }
//            }else{
//                if ((NSInteger)code == 0) {
//                    [weakSelf doParseError:NETWORK_ERROR_DATA];//格式不正确
//
//                }else{
//                    [[self responseParser] parseBackData];
//                }
//            }
        }
        
        
    });
}
//具体的错误返回处理
-(void)doParseError:(NSInteger)errorCode
{
    [[self responseParser] setErrorCode:errorCode];
    [[self responseParser] parseBackError];
}
- (void)cancleRequest{
    
}
/*
- (void)mainPostURIWithfunction:(NSString *)function param:(NSArray *)param{
    NSString *code = [NetWorkTool creatTheCodeWithDate:self.currentTimeStamp Param:param];
    NSString *postUrl = [[NSString stringWithFormat:@"%@?version=iphone%@&imei=%@&device=%@&code=%@&date=%@&function=%@",self.hostString,self.appVersion,self.IMEI,self.deviceScreen,code,self.currentTimeStamp,function] urlEncode];

    self.urlPathString = postUrl;
}
- (void)mainGetURIWithfunction:(NSString *)function{
    NSString *getUrl = [[NSString stringWithFormat:@"%@?version=iphone%@&imei=%@&device=%@&function=%@",self.hostString,self.appVersion,self.IMEI,self.deviceScreen,function] urlEncode];
    self.urlPathString = getUrl;
}
-(BaseResponse *)responseParser
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}
- (NSString *)IMEI{
    return [NetWorkTool getIMEI];
}
- (NSString *)appVersion{
    return @"4.5.0";
//    return [NetWorkTool appVersion];
}
- (NSString *)deviceScreen{
    return [NetWorkTool currentDeviceScreen];
}
 */
@end
