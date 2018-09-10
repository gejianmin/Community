//
//  JTDSocialShare.h
//  SwishChargeClient
//
//  Created by tongda ju on 2017/11/7.
//  Copyright © 2017年 JianMin Ge. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *    登录类型
 */
typedef NS_ENUM(NSInteger,ThirdLoginType) {
    
    QQLoginType = 1000,
    weChatLoginType = 1001,
    sinaLoginType = 1002
};

@class JTDShareContent,JTDUserInfoModel;

@interface JTDSocialShare : NSObject

+(instancetype)ShareUMSocial;

@property (nonatomic, strong) JTDShareContent *shareContentModel;

@property (nonatomic,assign) BOOL shareSucceed;

typedef void (^UMShareCompleteBlock)(BOOL result);

- (void)showSocialWithTag:(NSInteger)tag;

typedef void (^UMGetUserInfoCompleteBlock)(BOOL success,JTDUserInfoModel * userInfoModel);

@property (nonatomic,copy) UMGetUserInfoCompleteBlock  callBack;

- (void)getUserInfoWithController:(UIViewController *)controller withTag:(NSInteger)tag callBack:(UMGetUserInfoCompleteBlock)callBack;

@end

@interface JTDShareContent : NSObject

@property (nonatomic, strong) NSString *shareURL;
@property (nonatomic, strong) NSString *shareContent;
@property (nonatomic, strong) NSString *shareTitle;
@property (nonatomic, strong) NSString *d_Id;
@property (nonatomic, strong) UIImage *shareImage;
@property (nonatomic, strong) NSString * centent;/*!< 发布内容*/
@property (nonatomic, strong) NSString * images;/*!< 图片*/
@property (nonatomic, strong) NSString * name;/*!<用户名*/
@property (nonatomic, assign) BOOL shareSucceed;
@property (nonatomic, assign) BOOL BackGround;

//+ (JTDShareContent *)newShareModel;


@end
@interface JTDUserInfoModel : NSObject

@property (nonatomic, strong) NSString * uid;/*!< uid能否实现Android与iOS平台打通，目前QQ只能实现同APPID下用户ID匹配*/
@property (nonatomic, strong) NSString * openid;/*!< 主要为微信和QQ使用*/
@property (nonatomic, strong) NSString * unionId;/*!< 主要为微信和QQ使用，unionid主要用于微信、QQ用户系统打通*/
@property (nonatomic, strong) NSString * usid;/*!< 用于U-Share 4.x/5.x 升级后保留原先使用形式*/
@property (nonatomic, strong) NSString *name;/*!< 用户昵称*/
@property (nonatomic, strong) NSString * unionGender;/*!< 性别:男2*/
@property (nonatomic, strong) NSString * iconurl;/*!< 用户头像*/

@end
