//
//  CRMMineInfoSession.m
//  HHNetworking
//
//  Created by 赵东 on 2017/5/25.
//  Copyright © 2017年 HHAuto. All rights reserved.
//

#import "HHInterface.h"


@implementation CRMMineInfoSession

- (NSURLSessionDataTask *)asyncMineDataWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete{
    

    
    NSURLSessionDataTask *task=[self POST:[self urlWithPath:kEditUserInfo] params:pramas HTTPHeader:@{@"Content-Type":@"application/json;charset=UTF-8"} complete:^(id response, HHError *error) {
        if (response) {
            
//            NSMutableDictionary * dict =[[NSMutableDictionary alloc]init];
//            HomeProject * homeProject =[[HomeProject alloc]init];
//            homeProject.performanceTarget =response[@"data"][@"performanceTarget"];
//            homeProject.salesStatistics =response[@"data"][@"salesStatistics"];
//            //            homeProject.assessmentTargetDataList =response[@"data"][@"assessmentTargetDataList"];
//            //            homeProject.identifierDataList =response[@"data"][@"identifierDataList"];
//            //            homeProject.timeScopeDataList =response[@"data"][@"timeScopeDataList"];
//            if (homeProject.performanceTarget) {
//                [dict setObject:(NSArray *)homeProject.performanceTarget forKey:@"performanceTarget"];
//            }
//            if (homeProject.salesStatistics) {
//                [dict setObject:(NSArray *)homeProject.salesStatistics forKey:@"salesStatistics"];
//            }
//            //            [dict setObject:(NSArray *)homeProject.assessmentTargetDataList forKey:@"assessmentTargetDataList"];
//            //            [dict setObject:(NSArray *)homeProject.identifierDataList forKey:@"identifierDataList"];
//            //            [dict setObject:(NSArray *)homeProject.timeScopeDataList forKey:@"timeScopeDataList"];
            if (complete) {
                complete(response,nil);
            }
        }else{
            if (complete) {
                complete(nil,error);
            }
            
        }
    }];
    return task;
    
    
    
    
}



- (NSURLSessionDataTask *)yd_post:(NSString *)path params:(NSDictionary *)pramas model:(Class )Model complete:(HHSessionCompleteBlock)complete{
    
    
    
    NSURLSessionDataTask *task=[self POST:[self urlWithPath:path] params:pramas HTTPHeader:@{@"Content-Type":@"application/json;charset=UTF-8"} complete:^(id response, HHError *error) {
        if (response) {
 
            if (complete) {
                complete(response[@"data"][@"lastLoginInfo"],nil);
            }
            
        }else{
            if (complete) {
                complete(nil,error);
            }
            
            
        }
    }];
    return task;
    
    
    
    
}
- (NSURLSessionDataTask *)yd_post:(NSString *)path params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete{
    
    
    
    NSURLSessionDataTask *task=[self POST:[self urlWithPath:path] params:pramas HTTPHeader:@{@"Content-Type":@"application/json;charset=UTF-8"} complete:^(id response, HHError *error) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"2000001" object:nil];
        if (response) {

            NSString * code  = response[@"code"];
            switch ([code integerValue]) {
                case 20000:
                {
                    if (complete) {
                        complete(response[@"data"],nil);
                    }
                    
                }
                    break;
                case 40001:
                {
                    NSLog(@"40001 --- 版本号不存在");
                }
                    break;
                case 50000:
                {
                    NSLog(@"50000 --- 处理请求时发生异常");
                }
                    break;
                case 50002:
                {
                    NSLog(@"50002 --- 参数格式错误");
                }
                    break;
                case 70000:
                {
                    NSLog(@"70000 --- 请求参数为空");
                }
                    break;
                    
                default:
                {
                    NSLog(@"unkonwn --- 未知错误");
                }
                    break;
            }
          
        }else{
            if (complete) {
                complete(nil,error);
            }

            
        }
    }];
    return task;

    
}

- (NSURLSessionDataTask *)zd_post:(NSString *)path params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete{
    
    NSURLSessionDataTask *task=[self POST:[self urlWithPath:path] params:pramas HTTPHeader:@{@"Content-Type":@"application/json;charset=UTF-8"} complete:^(id response, HHError *error) {
        if (response) {
            
            if (complete) {
                complete(response,nil);
            }
            
        }else{
            if (complete) {
                complete(nil,error);
            }
            
            
        }
    }];
    return task;
    
    
}


@end
