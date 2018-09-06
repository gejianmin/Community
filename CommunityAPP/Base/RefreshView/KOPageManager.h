//
//  KOPageManager.h
//  KOShow
//
//  Created by 王光宾 on 16/4/14.
//  Copyright © 2016年 chenlei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KOPageManager : NSObject

// 总页数
@property(nonatomic, assign)NSInteger pageTotal;
// 当前页
@property(nonatomic, assign)NSInteger pageIndex;
// 每页的数据量
@property(nonatomic, assign)NSInteger numberPerPage;
// 上次页码
@property(nonatomic, assign)NSInteger lastPage;

@end
