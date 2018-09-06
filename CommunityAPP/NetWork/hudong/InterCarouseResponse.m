//
//  InterCarouseResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterCarouseResponse.h"
#import "InforVillage_CarouselModel.h"

@implementation InterCarouseResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InforVillage_CarouselModel *model =  [InforVillage_CarouselModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
