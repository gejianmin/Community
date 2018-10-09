//
//  LoginResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/9.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "LoginResponse.h"
#import "LoginModel.h"
#import "UserObjModel.h"

@implementation LoginResponse

- (void)parseBackData{
    NSDictionary *dic = self.responseData;
    LoginModel *model =  [LoginModel yy_modelWithJSON:dic];
    [self setUserObj:model];
    [self showFinishedResultDataInMainThreadToUI:model];

}
- (void)setUserObj:(LoginModel *)model{
    [[HHComlient sharedInstance] user].mobile = model.mobile;
    [[HHComlient sharedInstance] user].uid = model.uid;
    [[HHComlient sharedInstance] user].nickname = model.nickname;
    [[HHComlient sharedInstance] user].jifen = model.jifen;
    [[HHComlient sharedInstance] user].money = model.money;
    [[HHComlient sharedInstance] user].token = model.token;
    [[HHComlient sharedInstance] user].coin = model.coin;
    [[HHComlient sharedInstance] user].face = model.face;
}
@end
