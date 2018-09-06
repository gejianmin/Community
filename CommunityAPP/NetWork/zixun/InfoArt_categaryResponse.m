//
//  InfoArt_categaryResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InfoArt_categaryResponse.h"
#import "InfoArt_categaryModel.h"

@implementation InfoArt_categaryResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InfoArt_categaryModel *model =  [InfoArt_categaryModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
