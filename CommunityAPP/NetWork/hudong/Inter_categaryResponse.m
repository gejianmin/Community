//
//  Inter_categaryResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/20.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "Inter_categaryResponse.h"
#import "InterButton_categaryModel.h"

@implementation Inter_categaryResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InterButton_categaryModel *model =  [InterButton_categaryModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
