//
//  InterPostListResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterPostListResponse.h"
#import "InterPostListModel.h"

@implementation InterPostListResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InterPostListModel *model =  [InterPostListModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
