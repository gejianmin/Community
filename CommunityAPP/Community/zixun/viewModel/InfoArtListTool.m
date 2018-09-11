//
//  InfoArtListTool.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InfoArtListTool.h"
#import "UserObjModel.h"

@implementation InfoArtListTool

- (void)inforVillage_ListRequestSuccess:(void (^)(id))success fail:(void (^)(void))failer{
    
    __weak typeof(self) tyself = self;
    
    _reqStatus = RequestStatus_Responding;
    
    InforVillage_ListRequest *request = [[InforVillage_ListRequest alloc] init];
    NSString *ord_ID = [[HHClient sharedInstance] user].vid;
    [request InforVillage_ListRequestWithCat_id:_cat_id vid:ord_ID page:_pageIndex];
    [request setFinishedBlock:^(id object, id responseData) {
        
        tyself.reqStatus = RequestStatus_Finish;
        
        InforVillage_ListModel *model = object;
        if (model.list.count >0 ) {
            //说明有数据
            tyself.indexDataArray = model.list;
            
            if (tyself.status == RequestMode_Rrefresh) {
                tyself.dataArray = [tyself.indexDataArray mutableCopy];
            }else if (tyself.status == RequestMode_LoadMore){
                [tyself.dataArray addObjectsFromArray:model.list];
            }
        }
        success(nil);
    } failedBlock:^(NSInteger error, id responseData) {
        tyself.reqStatus = RequestStatus_Finish;
        failer();
    }];
}
- (void)setStatus:(RequestMode)status{
    _status = status;
    if (status == RequestMode_Rrefresh) {
        _pageIndex = 1;
    }else if (status == RequestMode_LoadMore){
        _pageIndex ++;
    }
}
@end
