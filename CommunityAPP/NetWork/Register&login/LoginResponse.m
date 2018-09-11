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
    [[HHClient sharedInstance] user].mobile = model.mobile;
    [[HHClient sharedInstance] user].uid = model.uid;
    [[HHClient sharedInstance] user].nickname = model.nickname;
    [[HHClient sharedInstance] user].jifen = model.jifen;
    [[HHClient sharedInstance] user].money = model.money;
    [[HHClient sharedInstance] user].token = model.token;
    [[HHClient sharedInstance] user].coin = model.coin;
    [[HHClient sharedInstance] user].face = model.face;
}
@end
