//
//  InterAPPButtonResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterAPPButtonResponse.h"
#import "InforVillage_AppButtonModel.h"

@implementation InterAPPButtonResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InforVillage_AppButtonModel *model =  [InforVillage_AppButtonModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
