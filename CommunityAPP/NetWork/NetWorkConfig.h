//
//  NetWorkConfig.h
//  55BBS
//
//  Created by KepenJ on 2017/2/24.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

/**
 网络请求配置的基础参数
 */

#import <Foundation/Foundation.h>
#import "MacroNetwork.h"

typedef void (^BBSRequestFinishedBlock)(id object, id responseData);
typedef void (^BBSRequestFailedBlock)(NSInteger error, id responseData);

@interface NetWorkConfig : NSObject

@property (nonatomic, copy) NSString * hostString;//服务器地址
@property (nonatomic, strong) NSString * urlPathString;//请求地址

@property (nonatomic, copy) NSString * httpMethod;//请求类型(GET、POST)
@property (nonatomic, strong) NSMutableDictionary *headerFields;//Https头部信息
@property (nonatomic, copy) NSDictionary *parameters;//POST参数
@property (nonatomic, copy) NSString *currentTimeStamp;//发起请求的当前时间戳
@property (nonatomic, assign) NSTimeInterval timeoutInterval;//超时时间

@property (nonatomic, copy) BBSRequestFinishedBlock finishedBlock;//请求完成回调
@property (nonatomic, copy) BBSRequestFailedBlock failedBlock;//请求失败回调

/**
 以下参数为code验证
 */
@property (nonatomic,copy) NSString *appVersion;//当前版本号
@property (nonatomic,copy) NSString *IMEI;//UDID
@property (nonatomic,copy) NSString *deviceScreen;//手机型号
@end
