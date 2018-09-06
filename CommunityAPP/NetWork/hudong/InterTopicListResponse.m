//
//  InterTopicListResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterTopicListResponse.h"
#import "InterTopicListModel.h"

@implementation InterTopicListResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InterTopicListModel *model =  [InterTopicListModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
