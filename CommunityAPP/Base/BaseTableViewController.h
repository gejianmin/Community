//
//  BaseTableViewController.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"
#import "KOPageManager.h"
#import "FooterRefreshView.h"
#import "HeaderRefreshView.h"

@interface BaseTableViewController : BaseViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) KOPageManager *pageManager;

/*
 *  设置刷新视图
 */
- (void)addRefreshHeaderView;

/*
 *  设置加载更多视图
 */
- (void)addRefreshFooterView;
@end
