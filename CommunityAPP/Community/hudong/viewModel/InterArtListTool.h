//
//  InterArtListTool.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/20.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InterPostListRequest.h"

typedef NS_ENUM(NSInteger,RequestMode){
    RequestMode_Unknow,
    RequestMode_Rrefresh,
    RequestMode_LoadMore
};

typedef NS_ENUM(NSInteger,RequestStatus) {
    RequestStatus_UnKnow,//请求未知
    RequestStatus_Responding,//正在响应
    RequestStatus_Finish,//完成请求
    RequestStatus_Failer//请求失败
};
@interface InterArtListTool : NSObject


@property (nonatomic, assign) NSInteger currentIndex;//当前页面索引
@property (nonatomic, strong) NSMutableArray *dataArray;//所有数据
@property (nonatomic, copy) NSArray *indexDataArray;//当前分页的数据
@property (nonatomic, assign) NSInteger pageIndex; //请求页数

@property (nonatomic, copy) NSString *cat_id;//文章分类ID
@property (nonatomic, assign) RequestMode status;
@property (nonatomic, assign) RequestStatus reqStatus;

- (void)inforVillage_ListRequestSuccess:(void(^)(id object))success fail:(void(^)(void))failer;
@end
