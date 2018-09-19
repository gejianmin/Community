//
//  InterButtonCateController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/20.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterButtonCateController.h"
#import "SGPagingView.h"
#import "UserObjModel.h"
#import "InterButton_categaryModel.h"
#import "InforArticleCell.h"
#import "InterArtListTool.h"
#import "Inter_categaryRequest.h"
#import "InterListCell.h"
#import "InterPostListRequest.h"
#import "InterButtonCateHeaderView.h"
typedef NS_ENUM(NSInteger,RefreshState) {
    RefreshState_Unknow,
    RefreshState_Refrsh,
    RefreshState_LoadMore
};

@interface InterButtonCateController ()<SGPageTitleViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *cateArray;
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, copy) NSString *topic_id;
@property (nonatomic, assign) RefreshState status;
@property(nonatomic,strong) InterButtonCateHeaderView * headerView;
@property (nonatomic, assign) NSInteger pageCount;
@end

@implementation InterButtonCateController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(240, 240, 240);
    _pageCount = 1;
    self.tableView.frame = CGRectMake(0, GSANavHeight, SCREEN_WIDTH, SCREEN_HEIGHT-GSANavHeight );
    [self.tableView setTableHeaderView:[self tableViewHeaderView]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _currentIndex = 0;
    
    [self setLeftItemWithImageTarget:self];
    self.title = self.headTitle;
    
    [self setCateGaryHeaderRequest];
    
    [self addRefreshHeaderView];
    [self addRefreshFooterView];
}
-(UIView *)tableViewHeaderView{
    
    self.headerView = [[InterButtonCateHeaderView alloc]initWithFrame:CGRectMake(0, 0, HH_SCREEN_W, 169) color:kColorWhite];
    return self.headerView;
}
- (void)refreshData
{
    _pageCount = 1;
    _status = RefreshState_Refrsh;
        [self postListRequest];
   
}
- (void)getMoreData
{
    _status = RefreshState_LoadMore;
        [self postListRequest];
    
}
-(void)setCateGaryHeaderRequest{
    __weak typeof(self) tyself = self;
    Inter_categaryRequest *request = [[Inter_categaryRequest alloc] init];
    [request InfoArt_categaryRequestWithLinkUrl:self.model.linkurl];
    [request setFinishedBlock:^(id object, id responseData) {
        Inter_categaryModel * model = [Inter_categaryModel yy_modelWithJSON:responseData[@"data"]];
        self.headerView.model = model;
        tyself.topic_id = model.topic_id;
        [tyself postListRequest];
        
    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
//
//- (void)setCateGaryRequestWithCat_Id:(NSString *)cat_Id{
//    
//    __weak typeof(self) tyself = self;
//    Inter_categaryRequest *request = [[Inter_categaryRequest alloc] init];
//    [request InfoArt_categaryRequestWithCat_ID:cat_Id];
//    [request setFinishedBlock:^(id object, id responseData) {
//        InterButton_categaryModel * model = object;
//        tyself.cateArray = [model.data mutableCopy];
//        if (tyself.cateArray.count>0) {
//            
//            [tyself setSGpage];
//            //创建模型
//            for (int i = 0; i<tyself.cateArray.count; i++) {
//                
//                Inter_categaryModel *cateModel = tyself.cateArray[i];
//                
//                InterArtListTool *tool = [[InterArtListTool alloc] init];
//                tool.currentIndex = i;
//                tool.cat_id = cateModel.topic_id;
//                tool.pageIndex = 1;//要请求的页码数
//                [tyself.listArray addObject:tool];
//            }
//            
//            //            //默认请求第一个分类数据
//            //            [tyself requestDataList];
//            
//            
//        }
//        
//    } failedBlock:^(NSInteger error, id responseData) {
//        
//    }];
//}
//帖子列表数据
- (void)postListRequest{
    [SVProgressHUD showInfoWithStatus:@"正在加载"];
    __weak typeof(self) tyself = self;
    InterPostListRequest *request = [[InterPostListRequest alloc] init];
    [request interPostListRequestWithTopic_id:_topic_id page:_pageCount];
    
    [request setFinishedBlock:^(id object, id responseData) {
        
        InterPostListModel *model = object;
        
        if (tyself.status == RefreshState_Refrsh) {
            //刷新
            tyself.listArray = [model.list mutableCopy];
        }else{
            [tyself.listArray addObjectsFromArray:model.list];
            tyself.pageCount ++;
        }
        [SVProgressHUD dismiss];
        [tyself.tableView reloadData];
        
        [tyself.tableView.mj_header endRefreshing];
        [tyself.tableView.mj_footer endRefreshing];
        
    } failedBlock:^(NSInteger error, id responseData) {
        [SVProgressHUD dismiss];
        
        [tyself.tableView.mj_header endRefreshing];
        [tyself.tableView.mj_footer endRefreshing];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.listArray.count>0) {
        return self.listArray.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"InterListCell";
    InterListCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[InterListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    cell.model = self.listArray[indexPath.row];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    PostListModel *model = self.listArray[indexPath.row];
    return [InterListCell getHeight:model];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSMutableArray *)listArray{
    if (_listArray == nil) {
        self.listArray = [NSMutableArray array];
    }
    return _listArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
