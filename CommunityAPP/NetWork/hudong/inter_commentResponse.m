//
//  inter_commentResponse.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/18.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "inter_commentResponse.h"
#import "inter_commentModel.h"

@implementation inter_commentResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    inter_commentModel *model =  [inter_commentModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
