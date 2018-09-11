//
//  JTDShareVC.h
//  PetSocialClient
//
//  Created by tongda ju on 2018/3/20.
//  Copyright © 2018年 JianMin Ge. All rights reserved.
//

#import "BaseViewController.h"
#import "JTDSocialShare.h"
typedef NS_ENUM(NSInteger, StateEnum)
{
    PayStateSuccess = 0,  //支付成功
    PayStateFailure,   //支付失败
    PayStateShare   // 分享
};
@interface JTDShareVC : BaseViewController

@property (nonatomic, strong) JTDShareContent *shareContentModel;
@property (nonatomic, strong) JTDShareContent * model;
@property (nonatomic, assign) StateEnum  type;

- (void)showPaySuccessWithResult:(StateEnum)result andController:(UIViewController *)controller;
    
+(void)shareToController:(UIViewController *)controller shareModel:(JTDShareContent *)model shareType:(StateEnum)shareType;
    
@property (nonatomic,assign) StateEnum payState;

@end
