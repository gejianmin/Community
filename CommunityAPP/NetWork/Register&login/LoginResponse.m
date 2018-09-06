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
    [UserObjModel shareIntance].mobile = model.mobile;
    [UserObjModel shareIntance].uid = model.uid;
    [UserObjModel shareIntance].nickname = model.nickname;
    [UserObjModel shareIntance].jifen = model.jifen;
    [UserObjModel shareIntance].money = model.money;
    [UserObjModel shareIntance].token = model.token;
    [UserObjModel shareIntance].coin = model.coin;
    [UserObjModel shareIntance].face = model.face;
}
@end
