//
//  RegisterResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/7.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RegisterResponse.h"
#import "RegisterModel.h"

@implementation RegisterResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    RegisterModel *model =  [RegisterModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];    
}
//-(void)parseBackError
//{
  //  [self showErrorResultInMainThreadToUI:self.errorCode];
    
//}
@end
