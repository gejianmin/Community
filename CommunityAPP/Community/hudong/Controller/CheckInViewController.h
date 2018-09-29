//
//  CheckInViewController.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/27.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger, btnType)
{
    jiaoyiType = 1000,  //
    hudongType = 1001,   //
};
typedef void(^callBack)(NSInteger btnTag);

@interface CheckInViewController : BaseViewController
@property(nonatomic,strong)callBack  callBack;

+(void)presentControllerWith:(UIViewController *)superController callBack:(callBack )callBack;

@end
