//
//  InfoArt_SearchResponse.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/13.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "InfoArt_SearchResponse.h"
#import "InforVillage_ArticleCateModel.h"

@implementation InfoArt_SearchResponse
- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InforVillage_ArticleCateModel *model =  [InforVillage_ArticleCateModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:jsonObject];
}
@end
