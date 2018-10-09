//
//  CRMTececonfereceSession.h
//  HHNetworking
//
//  Created by tongda ju on 2017/7/17.
//  Copyright © 2017年 HHAuto. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CRMTececonfereceSession <NSObject>

@optional

#pragma mark 电话会议相关--------------------------------------------
/*! @method 检查该企业是否开通呼叫、剩余分钟数
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncGetTeleconferenceSpeechCheckedWithpramas:(NSDictionary*)pramas
                                            complete:(HHSessionCompleteBlock)complete;
/*! @method 发起电话会议
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncGetTeleconferenceInitiateWithpramas:(NSDictionary*)pramas
                                                               complete:(HHSessionCompleteBlock)complete;
/*! @method 会议管理
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncGetTeleconferenceManageWithpramas:(NSDictionary*)pramas
                                                          complete:(HHSessionCompleteBlock)complete;
/*! @method 电话会议拨通状态回调地址
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncGetTeleconferenceCallingStatusWithpramas:(NSDictionary*)pramas
                                                          complete:(HHSessionCompleteBlock)complete;
/*! @method 结束会议
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncGetTeleconferenceTerminationWithpramas:(NSDictionary*)pramas
                                                          complete:(HHSessionCompleteBlock)complete;
/*! @method 历史会议
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncGetTeleconferenceHistoricalWithpramas:(NSDictionary*)pramas
                                                          complete:(HHSessionCompleteBlock)complete;


@end
