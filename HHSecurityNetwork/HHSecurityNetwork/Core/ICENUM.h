//
//  ICENUM.h
//  SwishChargeClient
//
//  Created by tongda ju on 2017/11/15.
//  Copyright © 2017年 JianMin Ge. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef NS_ENUM(NSUInteger,DrawerType) {
//    DrawerDefaultLeft = 1, // 默认动画，左侧划出
//    DrawerDefaultRight,    // 默认动画，右侧滑出
//    DrawerTypeMaskLeft,    // 遮盖动画，左侧划出
//    DrawerTypeMaskRight    // 遮盖动画，右侧滑出
//};

/*!< 第三方接口*/
typedef NS_ENUM(NSInteger,ICURLRequestType) {
    
    RealNameAuthenURLRequestType = 0,/*!< 实名认证请求*/
    
};

/*!< 支付宝或微信账户*/
typedef NS_ENUM(NSInteger,ICPayType) {
    
    ICALiPayType = 1, /*!< 支付宝*/
    ICWeChatPayType = 2 /*!< 微信*/
    
};



@end
