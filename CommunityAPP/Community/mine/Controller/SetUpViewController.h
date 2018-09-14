//
//  SetUpViewController.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2018/3/13.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^LogOutcallBack)(void);
@interface SetUpViewController : BaseViewController
@property(nonatomic,copy) LogOutcallBack   logOutcallBack;
@end
