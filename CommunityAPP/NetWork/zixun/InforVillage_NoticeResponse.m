//
//  InforVillage_NoticeResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_NoticeResponse.h"
#import "InforVillage_NoticeModel.h"

@implementation InforVillage_NoticeResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InforVillage_NoticeModel *model =  [InforVillage_NoticeModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
