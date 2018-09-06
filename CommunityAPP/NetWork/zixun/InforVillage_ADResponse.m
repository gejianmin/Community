//
//  InforVillage_ADResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_ADResponse.h"
#import "InforVillage_ADModel.h"

@implementation InforVillage_ADResponse
- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InforVillage_ADModel *model =  [InforVillage_ADModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
