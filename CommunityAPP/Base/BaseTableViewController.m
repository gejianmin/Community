//
//  BaseTableViewController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseTableViewController.h"
#import "HeaderRefreshView.h"
@interface BaseTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView setTableHeaderView:[self tableViewHeaderView]];
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];

}
-(UIView *)tableViewHeaderView{
    
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
#pragma mark - 添加刷新视图
- (void)addRefreshHeaderView
{
    /*
     // setup pull-to-refresh
     __weak typeof(self) weakSelf = self;
     [_dwTableView addPullToRefreshWithActionHandler:^{
     [weakSelf refreshData];
     }];
     */
    
    _tableView.mj_header = [HeaderRefreshView headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
}

- (void)refreshData
{
    /*
     _pageManager.pageIndex = 1;
     // 如果加载更多失效，重新启用
     if (_dwTableView.showsInfiniteScrolling == NO)
     {
     _dwTableView.showsInfiniteScrolling = YES;
     }
     [self requestDataList];
     */
    
    _pageManager.pageIndex = 1;
    // 如果加载更多失效，重新启用
    if (_tableView.mj_footer.state == MJRefreshStateNoMoreData)
    {
        _tableView.mj_footer.state = MJRefreshStateIdle;
    }
    [self requestDataList];
}
#pragma mark - 添加加载更多视图
- (void)addRefreshFooterView
{
    /*
     // setup infinite scrolling
     __weak typeof(self) weakSelf = self;
     [_dwTableView addInfiniteScrollingWithActionHandler:^{
     [weakSelf getMoreData];
     }];
     */
    
    _tableView.mj_footer = [FooterRefreshView footerWithRefreshingTarget:self refreshingAction:@selector(getMoreData)];
}

- (void)getMoreData
{
    _pageManager.pageIndex ++;
    [self requestDataList];
}

#pragma mark 获取数据
- (void)requestDataList
{
    // 子类实现
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
