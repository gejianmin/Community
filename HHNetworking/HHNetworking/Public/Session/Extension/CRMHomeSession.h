//
//  CRMHomeSession.h
//  HHNetworking
//
//  Created by tongda ju on 2017/5/22.
//  Copyright © 2017年 HHAuto. All rights reserved.
//

#import <Foundation/Foundation.h>

//@interface CRMHomeSession : NSObject
@protocol CRMHomeSession <NSObject>

@optional

/*! @method 用户搜索
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncSearchWithcurrUserId:(NSString *)currUserId
                                     currEnterpriseId:(NSString *)currEnterpriseId
                                    searchValue:(NSString *)searchValue
                                     complete:(HHSessionCompleteBlock)complete;

/*! @method 首页展示
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncHomeDataWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;

/*! @method 选项卡
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictCodesWithPramas:(NSArray *)array complete:(HHSessionCompleteBlock)complete;

@end
