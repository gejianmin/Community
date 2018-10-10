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
#import "MLPhotoBrowserViewController.h"

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
//#import "InforAppButtonCell.h"
#import "InteractionAppButtonCell.h"
#import "InterListCell.h"
//#import "InterCateCell.h"
#import "InterCateView.h"
#import "ListTableView.h"
#import "InteractionDetailVC.h"
#import "CheckInViewController.h"
#import "LoginViewController.h"
#import "MyCommunityVC.h"
#import "PresentTransition.h"

typedef NS_ENUM(NSInteger,RefreshState) {
    RefreshState_Unknow,
    RefreshState_Refrsh,
    RefreshState_LoadMore
};

@class MLPhoto;
@interface InteractionViewController ()<InforAppButtonCellDelegate,FocusScrollViewDelegate,ListTableViewDelegate,InterCateCellDelagate>


@property (nonatomic, strong) NSMutableArray *appButtonArray;
@property (nonatomic, strong) NSMutableArray *carouselArray;
@property (nonatomic, strong) NSMutableArray *listArray;

@property (nonatomic,copy) NSArray *topicListArray;//话题数组

@property (nonatomic, strong) ListTableView *listTabView;
@property(nonatomic,strong) InterCateView  * interCateView;
@property (nonatomic, strong) UIView * currentTopicBtn;
@property (nonatomic, strong) CustomBtn *fabuButton;

@property (nonatomic, copy) NSString *leftTitle;
@property (nonatomic, copy) NSString *rightTitle;

@property (nonatomic, copy) NSString *topic_id;

@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, assign) RefreshState status;
@property (nonatomic,strong) PresentTransition *transtionDelegate;

@end

@implementation InteractionViewController


#define instanceArray [NSArray arrayWithObjects:@"3千米",@"5千米",@"10千米",@"20千米", nil]

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"互动";
    _rightTitle = @"范围";
    _pageCount = 1;
    _status =RefreshState_Refrsh;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.fabuButton = [[CustomBtn alloc]initWithFrame:Frame(HH_SCREEN_W-24-65, HH_SCREEN_H-45-65-GSA_TabbarHeight-GSANavHeight, 65, 65) Tag:0 Title:@"" backgroundColor:kColorClear TitleTextColor:nil Font:0 Image:nil];
    [self.view addSubview:self.fabuButton];
    [self.fabuButton setImage:ImageNamed(@"fabu") forState:UIControlStateNormal];
    [self.fabuButton addTarget:self action:@selector(fabu:) forControlEvents:UIControlEventTouchUpInside];
//    [self.fabuButton makeCornerWithCornerRadius:32.5 borderWidth:0 borderColor:nil];
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
    
    NSString *ord_ID = [[HHComlient sharedInstance] user].vid;
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
    
    CGFloat lng = [[HHComlient sharedInstance] user].lng;
    CGFloat lat = [[HHComlient sharedInstance] user].lat;
    
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
    
    NSString *ord_ID = [[HHComlient sharedInstance] user].vid;
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
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
//        case 2:
//            return 0;
//            break;
        case 2:
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
        {
            return [InteractionAppButtonCell getHeight:self.appButtonArray.count];
        }
            break;
        case 2:
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
    if (indexPath.section == 0) {/** 轮播图*/
        static NSString *indentifier = @"InforCarouseCell";
        InforCarouseCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[InforCarouseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            cell.focusScrollView.delegate = self;
        }
        cell.carouselArray = self.carouselArray;
        return cell;
    }else if (indexPath.section == 1){/** 按钮*/
        static NSString *indentifier = @"InforAppButtonCell";
        InteractionAppButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[InteractionAppButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        }
        cell.delegate = self;
        cell.infoArray = self.appButtonArray;
        return cell;
        
    }else if (indexPath.section == 2){/** 邻里圈*/
        static NSString *indentifier = @"InterListCell";
        InterListCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[InterListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        }
        cell.model = self.listArray[indexPath.row];
        // 图片的点击回调
        __weak typeof(self) weakSelf = self;
        cell.tapBlock = ^(NSInteger index,NSMutableArray<MLPhoto *> *photos) {
            MLPhotoBrowserViewController *browserVC = [[MLPhotoBrowserViewController alloc] init];
            browserVC.isSimpleSacnViewCotroller = YES;
            browserVC.curPage = index;/** 点击的第几张图片*/
            browserVC.photos = photos; //存的是myphoto的对象
            browserVC.hidesBottomBarWhenPushed = YES;
            browserVC.transitioningDelegate = weakSelf.transtionDelegate;
            browserVC.modalPresentationStyle = UIModalPresentationCustom;
            [weakSelf presentViewController:browserVC animated:YES completion:nil];
            [browserVC displayForVC:weakSelf];
        };
        // 评论按钮的点击回调
        cell.btnClickBlock = ^(UIButton *button) {
            NSLog(@"点击回调回到控制器");
            if (button.tag == 11) {//评论按钮点击
                PostListModel *model = self.listArray[indexPath.row];
                InteractionDetailVC *VC = [[InteractionDetailVC alloc] init];
                VC.model = model;
                VC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:VC animated:YES];
            }
        };

        return cell;
    }
    return nil;
}
-(PresentTransition *)transtionDelegate{
    if (!_transtionDelegate) {
        _transtionDelegate = [[PresentTransition alloc]init];
    }
    return _transtionDelegate;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 2) {
//        PostListModel *model = self.listArray[indexPath.row];
//        InteractionDetailVC *VC = [[InteractionDetailVC alloc] init];
//        VC.model = model;
//        VC.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:VC animated:YES];
    }
} 
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 0;
            break;
        case 1:
            return 0;
            break;
        case 2:
            return 0;
            break;
        default:
            break;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 2){
        return 50;
    }else{
        return 0.0001;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]init];
    if (section == 2) {
        if (self.topicListArray.count!=0) {
        
        [headerView setBackgroundColor:kColorGray9];
        self.interCateView = [[InterCateView alloc]initWithFrame:CGRectMake(0, 0, HH_SCREEN_W, 50)];
        [headerView addSubview:self.interCateView];
        self.interCateView.delegate = self;
        self.interCateView.firstLabel.text = _leftTitle;
        [self.interCateView.thirdButton setTitle:_rightTitle forState:UIControlStateNormal];
        [self.interCateView.secondButton addTarget:self action:@selector(selectFirstButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.interCateView.thirdButton addTarget:self action:@selector(selectFirstButton:) forControlEvents:UIControlEventTouchUpInside];
        if (_currentTopicBtn.tag == 100) {
            [self.interCateView.firstLabel setTextColor:kColorRed];
            [self.interCateView.secondButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.interCateView.thirdButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }if (_currentTopicBtn.tag == 101) {
            [self.interCateView.firstLabel setTextColor:kColorBlack];
            [self.interCateView.secondButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.interCateView.thirdButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }if (_currentTopicBtn.tag == 102) {
            [self.interCateView.firstLabel setTextColor:kColorBlack];
            [self.interCateView.thirdButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.interCateView.secondButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        }
    }
    return headerView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]init];
    return headerView;
}
#pragma mark--类别筛选
- (void)tapSelect:(UIView *)sender{
    _currentTopicBtn = sender;
    [self.interCateView.secondButton setTitleColor:kColorBlack forState:UIControlStateNormal];
    [self.interCateView.thirdButton setTitleColor:kColorBlack forState:UIControlStateNormal];

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
#pragma mark--距离筛选
- (void)selectFirstButton:(UIButton *)sender{
    
    _currentTopicBtn = sender;
    if (sender.tag == 101){
        //最新
        _pageCount = 1;//重置刷新页数
        _status = RefreshState_Refrsh;
        [self postListRequest];
    }else{
        //范围
        CGPoint point = [sender convertPoint:CGPointMake(0, 0) toView:self.view];//[UIApplication sharedApplication].keyWindow
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
-(void)loginEvent{
    [[HHAlertView alloc]initWithTitle:@"提示" message:@"这位居民您还未登录，是否先登录呢？" showTarget:self handle:^(NSInteger index) {
        switch (index) {
            case 0:
                HHLog(@"取消");
                break;
            case 1:HHLog(@"确定");
            {
                [LoginViewController showControllerWithSuccess:^{
                    //                    [self loginState];
                } cancel:^{
                    
                }];
            }
                break;
                
            default:
                break;
        }
    } cancle:@"继续浏览" others:@"去登录吧", nil];
}
#pragma mark -- InforAppButtonCellDelegate  按钮代理
- (void)clickInfoAppButton:(NSInteger)index{
    
    Village_AppButtonModel *model = self.appButtonArray[index];
    InterButtonCateController *vc = [[InterButtonCateController alloc] init];
    vc.model = model;
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
    if(![[HHComlient sharedInstance]isLogin]){
        [self loginEvent];
    }else{
    [CheckInViewController presentControllerWith:self callBack:^(NSInteger btnTag) {
        if (btnTag == hudongType) {
//            [self enterCommunity];
            [InterPostViewController pushController:self topicListArray:self.topicListArray postType:PostType_LinLiQuan topicId:@""];
        }else{//交易
            [InterPostViewController pushController:self topicListArray:self.topicListArray postType:PostType_ErShou topicId:_topic_id];
        }
    }];
    }
}
-(void)enterCommunity{
    [[HHAlertView alloc]initWithTitle:@"提示" message:@"这位居民您还未入驻小区，是否先去入驻小区呢？" showTarget:self handle:^(NSInteger index) {
        switch (index) {
            case 0:
                HHLog(@"取消");
                break;
            case 1:HHLog(@"确定");
            {
                MyCommunityVC * VC = [[MyCommunityVC alloc]init];
                VC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
                
            default:
                break;
        }
    } cancle:@"继续浏览" others:@"去入驻吧", nil];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
