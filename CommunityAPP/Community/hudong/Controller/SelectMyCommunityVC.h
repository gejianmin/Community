//
//  SelectMyCommunityVC.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/28.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"
#import "NearCommunityModel.h"

typedef void(^callBack)(CommunityModel * model);

@interface SelectMyCommunityVC : BaseViewController

@property(nonatomic,strong) callBack  callBack;

+(void)pushToSelectViewController:(UIViewController *)superController callBack:(callBack )callBack;

@end
