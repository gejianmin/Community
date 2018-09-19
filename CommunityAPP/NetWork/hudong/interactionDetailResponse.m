//
//  interactionDetailResponse.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/17.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "interactionDetailResponse.h"
#import "interactionDetailModel.h"
@implementation interactionDetailResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    interactionDetailModel *model =  [interactionDetailModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
