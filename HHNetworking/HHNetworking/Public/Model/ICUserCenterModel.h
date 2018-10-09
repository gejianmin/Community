//
//  ICUserCenterModel.h
//  HHNetworking
//
//  Created by tongda ju on 2017/11/16.
//  Copyright © 2017年 HHAuto. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ICMyGoldModel,ICMyOrderModel;

@interface ICUserCenterModel : NSObject

@end

@interface ICMyGoldModel : NSObject

@property (nonatomic, strong)NSString * goldCount;/*!< 金币总量*/

@property (nonatomic, strong)NSString * operateType;/*!< 金币类型1出帐 2入帐*/

@property (nonatomic, strong)NSString * amount;/*!< 金币数量*/

@property (nonatomic, strong)NSString * item;/*!< 金币获得渠道*/

@property (nonatomic, strong)NSString * updateTime;/*!< 时间*/


@end

@interface ICMyOrderModel : NSObject

@property (nonatomic, strong)NSString * businessType;/*!< 业务类型1流量 2话费*/
@property (nonatomic, strong)NSString * orderName;/*!< 订单名称*/
@property (nonatomic, strong)NSString * orderNum;/*!< 订单号*/
@property (nonatomic, strong)NSString * orderTime;/*!< 订单日期*/
@property (nonatomic, strong)NSString * orderType;/*!<订单类型 1.充值订单 2.兑换订单 -1全部*/
@property (nonatomic, strong)NSString * packageSize;/*!< 流量话费包大小*/
@property (nonatomic, strong)NSString * payAmount;/*!< 支付金额*/
@property (nonatomic, strong)NSString * payTypeName;/*!< 支付方式名称*/
@property (nonatomic, strong)NSString * status;/*!订单状态1未支付 2支付成功 3支付失败 4充值中 5充值成功 6充值失败*/
@property (nonatomic, strong)NSString * statusDesc;/*!< 订单状态描述*/
@property (nonatomic, strong)NSString * payType;/*!< 支付方式*/
//订单详情添加字段
@property (nonatomic, strong)NSString * couponAmount;/*!< 优惠劵优惠金额*/
@property (nonatomic, strong)NSString * amount;/*!< 订单金额*/
@property (nonatomic, strong)NSString * phone;/*!< 充值手机号码*/
//@property (nonatomic, strong)NSString * businessTypeName;/*!< 业务类型名称*/

@end

@interface ICMyPrizeModel: NSObject

@property (nonatomic, strong)NSString * packageSize;/*!< 流量包大小/话费充值面额*/
@property (nonatomic, strong)NSString * userId;/*!< 用户ID*/
@property (nonatomic, strong)NSString * status;/*!状态1未使用 2已使用 3已过期*/
@property (nonatomic, strong)NSString * dayNum;/*!< 有效天数*/
@property (nonatomic, strong)NSString * name;/*!< 奖品名称*/
@property (nonatomic, strong)NSString * appDisplayName;/*!< app显示奖品名称*/
@property (nonatomic, strong)NSString * phone;/*!<充值手机号*/
@property (nonatomic, strong)NSString * type;/*!< 全部类型 1.流量 2.话费 3.优惠券 4.金币 */
@property (nonatomic, strong)NSString * endTime;/*!< 过期时间*/
@property (nonatomic, strong)NSString * prizeNum;/*!< 奖品数量\金币数量*/
@property (nonatomic, strong)NSString * updateTime;/*!<更新时间（流量话费充值时间）*/
@property (nonatomic, strong)NSString * myPrizeId;/*!<奖品ID*/



@end
