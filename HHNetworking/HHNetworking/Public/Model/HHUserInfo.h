//
//  HHUserInfo.h
//  HHNetworking
//
//  Created by qiangge on 2016/11/4.
//  Copyright © 2016年 HHAuto. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HHUserLabel,HHMessageStatus;
@interface HHUserInfo : NSObject <NSCoding>


@property (nonatomic, copy) NSString            *companyId;
@property (nonatomic, copy) NSString            *deptName;/*!< 部门名称*/
@property (nonatomic, copy) NSString            *deptId;/*!< 部门id*/
@property (nonatomic, copy) NSString            *ID;
@property (nonatomic, copy) NSString            *imageUrl;
@property (nonatomic, copy) NSString            *mail;
@property (nonatomic, copy) NSString            *mobile;/*!< 手机*/
@property (nonatomic, copy) NSString            *name;/*!< 姓名*/
@property (nonatomic, copy) NSString            *postName;/*!< 职位*/
@property (nonatomic, copy) NSString            *sex;/*!< 性别 1 男*/
@property (nonatomic, copy) NSString            *telePhone;/*!< 电话*/
@property (nonatomic, copy) NSString            *companyName;/*!< 公司名称*/
@property (nonatomic, copy) NSString            *userAccount;/*!< 用户账户*/



@end
@interface HHMessageStatus : NSObject

/*!<
 1    status    string    true    消息状态 1已读 2未读
 1    type    string    true    类型 1系统通知 2 新印象 3评论便便
 */
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *type;

- (BOOL)isRead;

@end
@interface HHUserLabel : NSObject

@property (nonatomic, strong) NSString *label;//用户擅长标签
@property (nonatomic, strong) NSString *label_id;//用户擅长标签id

@end

@class HHIDCardLegality,HHIDCardBirthday;


@interface HHIDCard : NSObject
@property (nonatomic, strong) NSString *issued_by;//签发机关
@property (nonatomic, strong) NSString *address;//地址
@property (nonatomic, strong) HHIDCardBirthday *birthday;//生日，下分年月日，都是一个字符串
@property (nonatomic, strong) NSString *gender;//性别（男/女）
@property (nonatomic, strong) NSString *id_card_number;//身份证号
@property (nonatomic, strong) NSString *name;//姓名
@property (nonatomic, strong) NSString *race;//民族（汉字）
@property (nonatomic, strong) NSString *side;//front/back 表示身份证的正面或者反面（illegal）
@property (nonatomic, strong) NSString *valid_date;//有效日期，格式为一个16位长度的字符串，表示内容如下YYYY.MM.DD-YYYY.MM.DD，或是YYYY.MM.DD-长期
@property (nonatomic, strong) HHIDCardLegality *legality;//
@end
@interface HHIDCardLegality : NSObject
@property (nonatomic, strong) NSString *Edited;//用工具合成或者编辑过的身份证图片
@property (nonatomic, strong) NSString *IDPhoto;//（正式身份证照片）
@property (nonatomic, strong) NSString *Photocopy;//（正式身份证的复印件）
@property (nonatomic, strong) NSString *Screen;//手机或电脑屏幕翻拍的照片）
@property (nonatomic, strong) NSString *TemporaryIDPhoto;//临时身份证照片

@end
@interface HHIDCardBirthday : NSObject
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *year;
@end


FOUNDATION_EXPORT NSString * const HHUserInfoWithImg;
