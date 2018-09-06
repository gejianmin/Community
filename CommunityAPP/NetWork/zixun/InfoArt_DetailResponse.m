//
//  InfoArt_ListResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InfoArt_DetailResponse.h"
#import "InfoArt_DetailModel.h"

@implementation InfoArt_DetailResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InfoArt_DetailModel *model =  [InfoArt_DetailModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
