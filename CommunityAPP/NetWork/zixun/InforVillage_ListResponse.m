//
//  InforVillage_ListResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/16.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_ListResponse.h"
#import "InforVillage_ListModel.h"

@implementation InforVillage_ListResponse
- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InforVillage_ListModel *model =  [InforVillage_ListModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
