//
//  VerificationToken_Response.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/10/10.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "VerificationToken_Response.h"
#import "VerificationToken_Model.h"
@implementation VerificationToken_Response

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    VerificationToken_Model *model =  [VerificationToken_Model yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
