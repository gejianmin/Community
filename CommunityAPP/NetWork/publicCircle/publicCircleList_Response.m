//
//  publicCircleList_Response.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/12.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "publicCircleList_Response.h"

#import "InForPublicCirCleList_Model.h"
@implementation publicCircleList_Response
    

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    InForPublicCirCleList_Model *model =  [InForPublicCirCleList_Model yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
