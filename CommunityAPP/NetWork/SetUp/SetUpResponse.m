//
//  SetUpResponse.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/10/9.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SetUpResponse.h"
#import "SetUpInfoModel.h"
@implementation SetUpResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    SetUpInfoModel *model =  [SetUpInfoModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
