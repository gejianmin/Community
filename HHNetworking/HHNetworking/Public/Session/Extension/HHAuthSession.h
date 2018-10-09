//
//  HHAuthSession.h
//  HHNetworking
//
//  Created by liuwenjie on 16/7/28.
//  Copyright © 2016年 HHAuto. All rights reserved.
//
//  登陆,注册,找回密码,修改密码
//  个人资料修改等等有关身份认证信息之类的请求管理


extern  NSString *const   kLoginFinishNotification;


@protocol HHAuthSession <NSObject>

@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *password;

@optional

/*! @method 用户登录
 *  @phone  手机号
 *  @pwd    密码
 *  @reponse HHUser
 */

/**
 用户登录

 @param phone 手机号
 @param pwd 密码
 @param complete 回调
 @return 返回参数
 */
- (NSURLSessionDataTask *)asyncLoginWithPhone:(NSString *)phone
                                    password:(NSString *)pwd
                                    complete:(HHSessionCompleteBlock)complete;
/*! @method 用户登录，选择公司
 *  @phone  userID
 *  @pwd    企业ID
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncInterLoginCompanyWithUserId:(NSString *)userId
                                     enterpriseId:(NSString * )enterpriseId
                                     complete:(HHSessionCompleteBlock)complete;
/*! @method 用户获取验证码
 *  @phone  手机号
 *  @pwd    密码
 *  @reponse HHUser
 */

- (NSURLSessionDataTask *)asyncGetVerificationCodeWithPhone:(NSString *)phone verson:(NSString *)verson complete:(HHSessionCompleteBlock)complete;

/*! @method 用户注册
 *  @phone  手机号
 *  @pwd    密码
 *  @reponse HHUser
 */

- (NSURLSessionDataTask *)asyncRegisterWithEnterpriseName:(NSString *)enterpriseName mobilePhone:(NSString *)mobilePhone realName:(NSString *)realName password:(NSString *)password complete:(HHSessionCompleteBlock)complete;
/*! @method 重置密码
 *  @phone  手机号
 *  @pwd    密码
 *  @reponse HHUser
 */

- (NSURLSessionDataTask *)asyncReSetPasswordWithMobilePhone:(NSString *)mobilePhone newPassword:(NSString *)newPassword complete:(HHSessionCompleteBlock)complete;

/*! @method 修改密码
 *  @phone  手机号
 *  @pwd    密码
 *  @reponse HHUser
 */

- (NSURLSessionDataTask *)asyncCRMUpdatePasswordWithPrama:(NSDictionary *)params complete:(HHSessionCompleteBlock)complete;


// 图片识别
- (NSURLSessionDataTask *)asyncAnalyzePictureFromAlibabaServiceWithPrama:(NSDictionary *)prama complete:(HHSessionCompleteBlock)complete;


- (NSURLSessionDataTask *)asyncLogOutcomplete:(HHSessionCompleteBlock)complete;

- (NSURLSessionDataTask *)asyncGetDetailInfocomplete:(HHSessionCompleteBlock)complete;



/*! @method 获取RSA密钥，后台需要提供.der文件形式的公钥或.p12格式的私钥，不能给.pem格式的.pem在iOS平台加密完后台不能解密
 *
 */
- (NSURLSessionDataTask *)asyncFetchRSAPublicKeyComplete:(HHSessionCompleteBlock)complete;

- (NSURLSessionDataTask *)post:(NSString *)path params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete;


@end

