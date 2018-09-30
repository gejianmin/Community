//
//  MyCommunityVC.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/28.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"
#import "NearCommunityModel.h"


typedef void(^MyCommunityCallBack)(GetCommunityModel * model);

@interface MyCommunityVC : BaseViewController


@property(nonatomic,strong) MyCommunityCallBack  callBack;

+(void)pushToMyCommunityViewController:(UIViewController *)superController callBack:(MyCommunityCallBack )callBack;

@end
