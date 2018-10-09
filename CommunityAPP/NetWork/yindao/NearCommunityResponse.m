//
//  nearCommunityResponse.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/11.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "NearCommunityResponse.h"
#import "NearCommunityModel.h"

@implementation NearCommunityResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    NearCommunityModel *model =  [NearCommunityModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
@implementation PubCommunityResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    NearCommunityModel *model =  [NearCommunityModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end

@implementation GetCommunityResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    GetCommunityArrModel *model =  [GetCommunityArrModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
}
@end
@implementation PublicCommunityResponse : BaseResponse

- (void)parseBackData{
    NSDictionary *jsonObject=self.responseData;
    NearCommunityModel *model =  [NearCommunityModel yy_modelWithJSON:jsonObject];
    [self showFinishedResultDataInMainThreadToUI:model];
    
}

@end
