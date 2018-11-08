//
//  SaveNickNameRespose.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/10/10.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SaveNickNameRespose.h"

@implementation SaveNickNameRespose
- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    [self showFinishedResultDataInMainThreadToUI:jsonObject];
}
@end
