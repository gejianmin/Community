//
//  CRMMineInfoSession.h
//  HHNetworking
//
//  Created by 赵东 on 2017/5/25.
//  Copyright © 2017年 HHAuto. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CRMMineInfoSession <NSObject>

- (NSURLSessionDataTask *)asyncMineDataWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;



- (NSURLSessionDataTask *)asyncLoginTimeWithPramas:(NSDictionary *)pramas path:(NSString *)path model:(id )Model  complete:(HHSessionCompleteBlock)complete;


- (NSURLSessionDataTask *)yd_post:(NSString *)path params:(NSDictionary *)pramas model:(id )Model complete:(HHSessionCompleteBlock)complete;


/**
 自定义请求

 @param path 路径
 @param pramas 请求参数
 @param complete 回调
 @return 请求任务
 */
- (NSURLSessionDataTask *)yd_post:(NSString *)path params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete;

- (NSURLSessionDataTask *)zd_post:(NSString *)path params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete;


@end

