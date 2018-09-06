//
//  BaseResponse.h
//  55BBS
//
//  Created by KepenJ on 2017/2/24.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MacroNetwork.h"
#import "YRClassSafeCategory.h"
#import <YYModel.h>

@class BaseRequest;

@interface BaseResponse : NSObject
@property (nonatomic, weak) BaseRequest * request;//请求体
@property (nonatomic, assign) NSInteger errorCode;//错误参数
@property (nonatomic, strong) id responseData;//请求数据

/*!
 *	@brief	请求出现错误时的处理
 */
-(void)parseBackError;

/*!
 *	@brief	解析方法
 */
-(void)parseBackData;

/*!
 *	@brief	开启网络连接的方法
 *
 *	@param 	mErrorCode 	gpuImageView的frame
 */
-(void)showErrorResultInMainThreadToUI:(NSInteger)mErrorCode;

/*!
 *	@brief	检查数据返回类型是否正确
 *
 *	@param 	mResultData 	网络返回数据
 */
-(void)showFinishedResultDataInMainThreadToUI:(id)mResultData;
@end
