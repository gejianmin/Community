//
//  InteractionViewController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/4.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InteractionViewController.h"
#import "InterButtonCateController.h"
#import "WebViewController.h"
#import "InterPostViewController.h"

#import "InterAPPButtonRequest.h"
#import "InterCarouseRequest.h"
#import "InterPostListRequest.h"
#import "InterTopicListRequest.h"
#import "InterNearPostRequest.h"

#import "UserObjModel.h"
#import "InforVillage_AppButtonModel.h"
#import "InforVillage_CarouselModel.h"
#import "InterTopicListModel.h"
#import "InterPostListModel.h"

#import "InforCarouseCell.h"
#import "InforAppButtonCell.h"
#import "InterListCell.h"
#import "InterCateCell.h"

#import "ListTableView.h"

typedef NS_ENUM(NSInteger,RefreshState) {
    RefreshState_Unknow,
    RefreshState_Refrsh,
    RefreshState_LoadMore
};

@interface InteractionViewController ()<InforAppButtonCellDelegate,FocusScrollViewDelegate,ListTableViewDelegate,InterCateCellDelagate>
@property (nonatomic, strong) NSMutableArray *appButtonArray;
@property (nonatomic, strong) NSMutableArray *carouselArray;
@property (nonatomic, strong) NSMutableArray *listArray;

@property (nonatomic,copy) NSArray *topicListArray;//话题数组

@property (nonatomic, strong) ListTableView *listTabView;

@property (nonatomic, strong) UIView * currentTopicBtn;
@property (nonatomic, strong) UIButton *fabuButton;

@property (nonatomic, copy) NSString *leftTitle;
@property (nonatomic, copy) NSString *rightTitle;

@property (nonatomic, copy) NSString *topic_id;

@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, assign) RefreshState status;
@end

@implementation InteractionViewController


#define instanceArray [NSArray arrayWithObjects:@"范围",@"3千米",@"5千米",@"10千米",@"20千米", nil]

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"互动";
    _rightTitle = @"范围";
    _pageCount = 1;
    _status =RefreshState_Refrsh;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.fabuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.fabuButton setImage:[UIImage imageNamed:@"fabu"] forState:UIControlStateNormal];
    [self.view addSubview:self.fabuButton];
    [self.fabuButton addTarget:self action:@selector(fabu:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.fabuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(-50);
    }];
    
    [self addRefreshHeaderView];
    [self addRefreshFooterView];
    
    [self villageButtonRequest];//按钮数据请求
    [self carouselRequest];//轮播图数据请求
    [self topicListRequest];//话题数据请求
}
- (void)refreshData
{
    _pageCount = 1;
    _status = RefreshState_Refrsh;
    if ([_rightTitle isEqualToString:@"范围"]) {
        [self postListRequest];
    }else{
        [self nearPostListRequest];
    }
}
- (void)getMoreData
{
    _status = RefreshState_LoadMore;
    if ([_rightTitle isEqualToString:@"范围"]) {
        [self postListRequest];
    }else{
        [self nearPostListRequest];
    }
}
//互动按钮请求
- (void)villageButtonRequest{
    
    __weak typeof(self) tyself = self;
    InterAPPButtonRequest *request = [[InterAPPButtonRequest alloc] init];
    
    NSString *ord_ID = [[HHClient sharedInstance] user].vid;
    [request interAPPButtonRequestWithID:ord_ID];
    [request setFinishedBlock:^(id object, id responseData) {
        
        InforVillage_AppButtonModel *model = object;
        tyself.appButtonArray = [model.Village_ModelArray mutableCopy];
        [tyself.tableView reloadData];
    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
//获取互动话题列表
- (void)topicListRequest{
    __weak typeof(self) tyself = self;
    InterTopicListRequest *request = [[InterTopicListRequest alloc] init];
    [request interTopicListRequestWithID];
    
    [request setFinishedBlock:^(id object, id responseData) {
    
        InterTopicListModel *model = object;
        tyself.topicListArray = model.data;
        [tyself.tableView reloadData];
        
        //列表请求
        if (tyself.topicListArray.count== 0) {
            return;
        }
        TopicListModel *topicmodel = tyself.topicListArray[0];
        tyself.leftTitle = topicmodel.topic_name;
        tyself.topic_id = topicmodel.topic_id;
        [tyself postListRequest];

    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
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
//帖子列表数据
- (void)nearPostListRequest{
    
    [SVProgressHUD showWithStatus:@"正在加载"];
    __weak typeof(self) tyself = self;
    InterNearPostRequest *request = [[InterNearPostRequest alloc] init];
    
    CGFloat lng = [[HHClient sharedInstance] user].lng;
    CGFloat lat = [[HHClient sharedInstance] user].lat;
    
    CGFloat miters = 0;
    if ([_rightTitle containsString:@"3"]) {
        miters = 3;
    }else if ([_rightTitle containsString:@"5"]){
        miters = 5;
    }else if ([_rightTitle containsString:@"1"]){
        miters = 10;
    }else if ([_rightTitle containsString:@"2"]){
        miters = 20;
    }

    [request interPostListRequestWithTopic_id:_topic_id page:_pageCount lng:lng lat:lat miters:miters];
    
    [request setFinishedBlock:^(id object, id responseData) {
        
        InterPostListModel *model = object;
        
        if (tyself.status == RefreshState_Refrsh) {
            //刷新
            tyself.listArray = [model.list mutableCopy];
        }else{
            [tyself.listArray addObjectsFromArray:model.list];
            tyself.pageCount ++;
        }
        [tyself.tableView reloadData];
        
        [SVProgressHUD dismiss];
        
        [tyself.tableView.mj_header endRefreshing];
        [tyself.tableView.mj_footer endRefreshing];
        
    } failedBlock:^(NSInteger error, id responseData) {
        [SVProgressHUD dismiss];
        
        [tyself.tableView.mj_header endRefreshing];
        [tyself.tableView.mj_footer endRefreshing];
    }];
}
//轮播图请求
- (void)carouselRequest{
    __weak typeof(self) tyself = self;
    InterCarouseRequest *request = [[InterCarouseRequest alloc] init];
    
    NSString *ord_ID = [[HHClient sharedInstance] user].vid;
    [request interCarouseRequestWithID:ord_ID];
    [request setFinishedBlock:^(id object, id responseData) {
        
        InforVillage_CarouselModel *model = object;
        tyself.carouselArray = [model.Village_CarouselArray mutableCopy];
        [tyself.tableView reloadData];
    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
#pragma mark ----UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return self.listArray.count;
            break;
        default:
            break;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 200;
            break;
        case 1:
            return 100;
            break;
        case 2:
            return 50;
            break;
        case 3:
        {
            PostListModel *model = self.listArray[indexPath.row];
            return [InterListCell getHeight:model];
        }
            break;
        default:
            break;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
        static NSString *indentifier = @"InforCarouseCell";
        InforCarouseCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[InforCarouseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.focusScrollView.delegate = self;
        }
        cell.carouselArray = self.carouselArray;
        return cell;
    }else if (indexPath.section == 1){
        static NSString *indentifier = @"InforAppButtonCell";
        InforAppButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[InforAppButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        }
        cell.delegate = self;
        cell.infoArray = self.appButtonArray;
        return cell;
    }else if (indexPath.section == 2){
        static NSString *indentifier = @"InterCateCell";
        InterCateCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[InterCateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        }
        cell.delegate = self;
        cell.firstLabel.text = _leftTitle;
        [cell.thirdButton setTitle:_rightTitle forState:UIControlStateNormal];
        [cell.secondButton addTarget:self action:@selector(selectFirstButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.thirdButton addTarget:self action:@selector(selectFirstButton:) forControlEvents:UIControlEventTouchUpInside];

        if ([_rightTitle isEqualToString:@"范围"]) {
            [cell.thirdButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }else{
            [cell.thirdButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        return cell;
    }else if (indexPath.section == 3){
        static NSString *indentifier = @"InterListCell";
        InterListCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[InterListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        }
        cell.model = self.listArray[indexPath.row];
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 0;
            break;
        case 1:
            return 5;
            break;
        case 2:
            return 5;
            break;
        case 3:
            return 0;
            break;
        default:
            break;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//
//    Village_ArticleCateModel *model = self.listArray[_currenIndex];
//    Village_ArticleListModel *listModel = model.article_list[indexPath.row];
//
//    ArtDetailViewController *vc = [[ArtDetailViewController alloc] init];
//    vc.art_id =listModel.article_id;
//    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
//    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)tapSelect:(UIView *)sender{
    _currentTopicBtn = sender;
//    [UIView animateWithDuration:0.15 animations:^{
//        sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
//    }];
    //邻里
    CGPoint point = [sender convertPoint:CGPointMake(0, 0) toView:self.view];
    CGRect rect = CGRectMake(point.x, point.y, sender.width, sender.height);
    
    if (self.topicListArray.count==0) {
        return;
    }
    NSMutableArray *titleArray = [NSMutableArray array];
    for (int i = 0; i<self.topicListArray.count; i++) {
        TopicListModel *model = self.topicListArray[i];
        [titleArray addObject:model.topic_name];
    }
    _listTabView.titleArray = titleArray;
    
    [self showListTableView:rect titleArray:titleArray];
}

- (void)selectFirstButton:(UIButton *)sender{
    if (sender.tag == 101){
        //最新
        _pageCount = 1;//重置刷新页数
        _status = RefreshState_Refrsh;
        [self postListRequest];
    }else{
        //范围
        CGPoint point = [sender convertPoint:CGPointMake(0, 0) toView:[UIApplication sharedApplication].keyWindow];
        CGRect rect = CGRectMake(point.x, point.y, sender.width, sender.height);
        [self showListTableView:rect titleArray:instanceArray];
        
    }
}

- (void)showListTableView:(CGRect)rect titleArray:(NSArray *)titleArray{
    _listTabView = [[ListTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _listTabView.delegate =self;
    [self.view addSubview:_listTabView];
    _listTabView.superRect = rect;
    _listTabView.titleArray = titleArray;
    
}
- (void)close{
    if (_currentTopicBtn.tag == 100) {
        //邻里
//        [UIView animateWithDuration:0.15 animations:^{
//            _currentTopicBtn.imageView.transform = CGAffineTransformIdentity;
//        }];
    }
    [_listTabView removeFromSuperview];
    _listTabView = nil;
}
- (void)selectIndex:(NSInteger)index{
    
    _pageCount = 1;//重置刷新页数
    _status = RefreshState_Refrsh;
    if (_currentTopicBtn.tag == 100) {
        //邻里
        TopicListModel *model = self.topicListArray[index];
        _leftTitle = model.topic_name;
        
        _topic_id = model.topic_id;
        
        //这里要判断是否有距离的限制
        if ([_rightTitle isEqualToString:@"范围"]) {
            [self postListRequest];
        }else{
            [self nearPostListRequest];
        }
    }else if (_currentTopicBtn.tag == 102){
        //距离
        _rightTitle = instanceArray[index];
        
        //这里要判断是否有距离的限制
        if ([_rightTitle isEqualToString:@"范围"]) {
            [self postListRequest];
        }else{
            [self nearPostListRequest];
        }
    }
    [_listTabView removeFromSuperview];
    _listTabView = nil;
    
    [self.tableView reloadData];
    
}
#pragma mark -- InforAppButtonCellDelegate  按钮代理
- (void)clickInfoAppButton:(NSInteger)index{
    
    Village_AppButtonModel *model = self.appButtonArray[index];
    InterButtonCateController *vc = [[InterButtonCateController alloc] init];
    vc.cat_id = model.linkurl;
    vc.headTitle = model.title;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -- 轮播图 FocusScrollViewDelegate
- (void)fScrollViewDidClicked:(NSInteger)index{
    Village_CarouselModel * model = self.carouselArray[index];
    
    WebViewController *webVC = [[WebViewController alloc] init];
    webVC.urlString = model.link_url;
    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
    
}
- (void)fabu:(UIButton *)sender{
    InterPostViewController *vc = [[InterPostViewController alloc] init];
    vc.topicListArray = self.topicListArray;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
