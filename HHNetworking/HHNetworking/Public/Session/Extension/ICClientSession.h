//
//  ICClientSession.h
//  HHNetworking
//
//  Created by tongda ju on 2017/10/27.
//  Copyright © 2017年 HHAuto. All rights reserved.
//  趣充项目接口

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString * const kLoginSingleSignOnNotification;

extern  NSString *const   kLoginMustNotification;

@protocol ICClientSession <NSObject>

@optional

/**
 自定义请求
 
 @param path 路径
 @param pramas 请求参数
 @param complete 回调参数为response
 @return 请求任务
 */
- (NSURLSessionDataTask *)IC_Post:(NSString *)path params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete;

/**
 自定义请求
 
 @param path 自定义路径
 @param pramas 请求参数
 @param complete 回调参数为response
 @return 请求任务
 */
- (NSURLSessionDataTask *)IC_PostWithCustomURL:(NSString *)path params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete;

/**
 自定义请求
 
 @param path 路径
 @param HTTPHeaderDictionary 请求头参数
 @param pramas 请求参数
 @param complete 回调参数为response
 @return 请求任务
 */
- (NSURLSessionDataTask *)OA_Post:(NSString *)path HTTPHeaderValue:(NSDictionary *)HTTPHeaderDictionary params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete;
/**
 自定义请求
 
 @param path 路径
 @param pramas 请求参数
 @param complete 回调参数为response
 @return 请求任务
 */
- (NSURLSessionDataTask *)OA_PostNormal:(NSString *)path params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete;
/*! @method 上传单张图片
 *  @image  UIImage
 *  @reponse HHImagePath 对象
 */
- (NSURLSessionDataTask *)OA_asyncUploadImage:(UIImage *)image path:(NSString *)path complete:(HHSessionCompleteBlock )complete;

- (NSURLSessionDataTask *)post_asyncUploadImage:(UIImage *)image path:(NSString *)path complete:(HHSessionCompleteBlock )complete;
/**
 用来处理后台返回的不规则数据

 @param path 路径
 @param pramas 请求参数
 @param complete 回调参数为response
 @return 请求任务
 */
- (NSURLSessionDataTask *)OA_PostNormalFormData:(NSString *)path params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete;
@end
