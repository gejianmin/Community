//
//  InforVillage_ArticleCateResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforVillage_ArticleCateResponse.h"
#import "InforVillage_ArticleCateModel.h"

@implementation InforVillage_ArticleCateResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InforVillage_ArticleCateModel *model =  [InforVillage_ArticleCateModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
