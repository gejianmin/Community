//
//  BaseRequest.h
//  55BBS
//
//  Created by KepenJ on 2017/2/24.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

/**
 网络请求基类
 */
#import "NetWorkConfig.h"
#import <AFNetworking.h>
#import "NetWorkTool.h"

@class BaseResponse;

@interface BaseRequest : NetWorkConfig
{
    BaseResponse * _responseParser;
}
@property (nonatomic,strong) AFHTTPSessionManager *httpsManager;//请求管理者
//@property (nonatomic,strong) BaseResponse *responseParser;//

/**
 *	@brief	网络请求的block回调方法
 *
 *   @param finishedBlock 请求成功的block块
 *
 *   @param failedBlock 请求失败的block块
 *
 */
-(void)setFinishedBlock:(BBSRequestFinishedBlock)finishedBlock failedBlock:(BBSRequestFailedBlock)failedBlock;

/**
 *取消请求
 */
- (void)cancleRequest;

/**
 *拼接POST接口
 *
 *@param function 方法名称
 */
- (void)mainPostURIWithfunction:(NSString *)function param:(NSArray *)param;

/**
 拼接GET接口

 @param function 方法名称
 */
- (void)mainGetURIWithfunction:(NSString *)function;
/**
 *调用BaseResponse内部操作的方法
 *
 @return 返回解析对象
 */
- (BaseResponse *)responseParser;
@end

#define ResponserParserGenerate(responseClassName) \
-(BaseResponse *)responseParser{\
if (!_responseParser) {\
_responseParser=[[responseClassName alloc]init];\
[_responseParser setRequest:self];\
}\
return _responseParser;\
}
