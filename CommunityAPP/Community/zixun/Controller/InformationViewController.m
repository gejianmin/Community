//
//  InformationViewController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/4.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InformationViewController.h"
#import "InforVillage_AppButtonRequest.h"
#import "InforVillage_CarouselRequest.h"
#import "InforVillage_NoticeRequest.h"
#import "InforVillage_ArticleCateRequest.h"
#import "InforVillage_ADRequest.h"
#import "InforVillage_ListRequest.h"
#import "UserObjModel.h"

#import "InforVillage_ADModel.h"
#import "InforVillage_AppButtonModel.h"
#import "InforVillage_NoticeModel.h"
#import "InforVillage_ArticleCateModel.h"
#import "InforVillage_CarouselModel.h"
#import "InforVillage_ListModel.h"

#import "InforAppButtonCell.h"
#import "InforCarouseCell.h"
#import "InforNoticeCell.h"
#import "InforADCell.h"
#import "InforArticleCell.h"
#import "InfoCategaryCell.h"

#import "AreaSelectorView.h"

#import "WebViewController.h"
#import "InforButtonCateController.h"
#import "ArtDetailViewController.h"

@interface InformationViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate,FocusScrollViewDelegate,InforADCellDelegate,InfoCategaryCellDelegate,InforAppButtonCellDelegate>

@property (nonatomic, strong) NSMutableArray *carouselArray;
@property (nonatomic, strong) NSMutableArray *appButtonArray;
@property (nonatomic, strong) InforVillage_NoticeModel *noticeModel;
@property (nonatomic, strong) NSMutableArray *adArray;
@property (nonatomic, strong) NSMutableArray *listArray;

@property (nonatomic, assign) NSInteger currenIndex;
//分页索引
@property (nonatomic, assign) NSInteger firstIndex;
@property (nonatomic, assign) NSInteger secondIndex;
@property (nonatomic, assign) NSInteger thirdIndex;
//view
@property(nonatomic, strong) AreaSelectorView * areaSelecotorV;//选择区域器
@end

@implementation InformationViewController

- (instancetype)init{
    if (self = [super init]) {
        
        _firstIndex = 2;
        _secondIndex = 1;
        _thirdIndex = 1;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    [self villageButtonRequest];
    [self carouselRequest];
    [self noticeRequest];
    [self articleCateRequest];
    [self ADRequest];
    
    [self setUpUI];
    [self addRefreshHeaderView];
    [self addRefreshFooterView];
    
    if ([self.tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
        }
    }
    
}

// 当前页面隐藏导航条
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}
- (void)dealloc {
    self.navigationController.delegate = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    self.fd_prefersNavigationBarHidden = NO;
}
- (void)setUpUI{
    
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 49);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 区域选择器
    
    [self createAreaSelector];
}

- (void)createAreaSelector {
    
    self.areaSelecotorV = [[AreaSelectorView alloc]initWithFrame:CGRectMake(0, 20,self.view.width/2, 30)];
    [self.view addSubview:_areaSelecotorV];
    
}


- (void)refreshData
{
    _firstIndex = 1;
    _secondIndex = 1;
    _thirdIndex = 1;
    [self requestDataList];

}
- (void)getMoreData
{
    [self requestDataList];
}
//资讯按钮请求
- (void)villageButtonRequest{
    
    __weak typeof(self) tyself = self;
    InforVillage_AppButtonRequest *request = [[InforVillage_AppButtonRequest alloc] init];
    
    NSString *ord_ID = [[HHClient sharedInstance] user].vid;
    [request InforVillage_AppButtonRequestWithID:ord_ID];
    [request setFinishedBlock:^(id object, id responseData) {
        
        InforVillage_AppButtonModel *model = object;
        tyself.appButtonArray = [model.Village_ModelArray mutableCopy];
//        [tyself.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
        [tyself.tableView reloadData];
    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
//轮播图请求
- (void)carouselRequest{
    __weak typeof(self) tyself = self;
    InforVillage_CarouselRequest *request = [[InforVillage_CarouselRequest alloc] init];
    
    NSString *ord_ID = [[HHClient sharedInstance] user].vid;
    [request InforVillage_CarouselRequestWithID:ord_ID];
    [request setFinishedBlock:^(id object, id responseData) {
        
        InforVillage_CarouselModel *model = object;
        tyself.carouselArray = [model.Village_CarouselArray mutableCopy];
//        [tyself.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
        [tyself.tableView reloadData];
    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
- (void)noticeRequest{
    __weak typeof(self) tyself = self;
    InforVillage_NoticeRequest *request = [[InforVillage_NoticeRequest alloc] init];
    
    [request InforVillage_NoticeRequest];
    [request setFinishedBlock:^(id object, id responseData) {
        tyself.noticeModel = object;
//        [tyself.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
        [tyself.tableView reloadData];

    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
//列表请求
- (void)articleCateRequest{
    __weak typeof(self) tyself = self;
    InforVillage_ArticleCateRequest *request = [[InforVillage_ArticleCateRequest alloc] init];
    NSString *ord_ID = [[HHClient sharedInstance] user].vid;
    [request InforVillage_ArticleCateRequestWithID:ord_ID];
    [request setFinishedBlock:^(id object, id responseData) {
        
        InforVillage_ArticleCateModel *model = object;
        tyself.listArray = [model.Village_ArticleCateArray mutableCopy];
//        [tyself.tableView reloadSections:[NSIndexSet indexSetWithIndex:4] withRowAnimation:UITableViewRowAnimationNone];
//        [tyself.tableView reloadSections:[NSIndexSet indexSetWithIndex:5] withRowAnimation:UITableViewRowAnimationNone];
        [tyself.tableView reloadData];

    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
//广告请求
- (void)ADRequest{
    __weak typeof(self) tyself = self;
    InforVillage_ADRequest *request = [[InforVillage_ADRequest alloc] init];
    NSString *ord_ID = [[HHClient sharedInstance] user].vid;
    [request InforVillage_ADRequestWithID:ord_ID];
    [request setFinishedBlock:^(id object, id responseData) {
        
        InforVillage_ADModel *model = object;
        tyself.adArray = [model.Village_ADArray mutableCopy];
        [tyself.tableView reloadData];

    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
//分类请求
- (void)requestDataList{
    __weak typeof(self) tyself = self;
    
    Village_ArticleCateModel *model = self.listArray[_currenIndex];
    NSString *cat_id = model.cat_id;
    NSInteger index = _currenIndex?(_currenIndex == 1?_secondIndex:_thirdIndex):_firstIndex;
    __block NSInteger current_index = _currenIndex;//原子操作，防止切换分类按钮时，index被重置
    
    InforVillage_ListRequest *request = [[InforVillage_ListRequest alloc] init];
    NSString *ord_ID = [[HHClient sharedInstance] user].vid;
    [request InforVillage_ListRequestWithCat_id:cat_id vid:ord_ID page:index];
    [request setFinishedBlock:^(id object, id responseData) {
        
        InforVillage_ListModel *model = object;
        if (model.list.count >0 ) {
            Village_ArticleCateModel *cateModel = tyself.listArray[current_index];
            //说明有数据
            if ((current_index ==0 && tyself.firstIndex == 1) || (current_index ==1 && tyself.secondIndex == 1) ||(current_index ==2 && tyself.thirdIndex == 1)) {
                //刷新
                cateModel.article_list = [NSArray array];
            }
            
            NSMutableArray *array = [cateModel.article_list mutableCopy];
            [array addObjectsFromArray:model.list];
            cateModel.article_list = array;
            
            if (current_index) {
                if (current_index == 1) {
                    tyself.secondIndex ++;
                }else{
                    tyself.thirdIndex ++;
                }
            }else{
                tyself.firstIndex ++;
            }
        }
        [tyself.tableView reloadData];
        [tyself.tableView.mj_footer endRefreshing];
        [tyself.tableView.mj_header endRefreshing];

    } failedBlock:^(NSInteger error, id responseData) {
        [tyself.tableView.mj_footer endRefreshing];
        [tyself.tableView.mj_header endRefreshing];
    }];
}
#pragma mark ----UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
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
            return 1;
            break;
        case 4:
            return 1;
            break;
        case 5:
        {
            Village_ArticleCateModel *model = self.listArray[_currenIndex];
            return model.article_list.count;
        }
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
            return 70;
            break;
        case 3:
            return 160;
            break;
        case 4:
            return 50;
            break;
        case 5:
        {
            Village_ArticleCateModel *model = self.listArray[_currenIndex];
            if (model.article_list.count>0) {
                return 110;
            }
            return 0;
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
        static NSString *indentifier = @"InforNoticeCell";
        InforNoticeCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[InforNoticeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        }
        cell.model = self.noticeModel;
        return cell;
    }else if (indexPath.section == 3){
        static NSString *indentifier = @"InforADCell";
        InforADCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[InforADCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        }
        cell.delegate = self;
        cell.adArray = self.adArray;
        return cell;
    }else if (indexPath.section == 4){
        static NSString *indentifier = @"InfoCategaryCell";
        InfoCategaryCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[InfoCategaryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        }
        cell.delagate = self;
        cell.categoryArray = self.listArray;
        return cell;
    }else if (indexPath.section == 5){
        static NSString *indentifier = @"InforArticleCell";
        InforArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[InforArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        }
        Village_ArticleCateModel *model = self.listArray[_currenIndex];
        cell.model = model.article_list[indexPath.row];
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
            return 10;
            break;
        case 4:
            return 10;
            break;
        case 5:
            return 0;
            break;
        default:
            break;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Village_ArticleCateModel *model = self.listArray[_currenIndex];
    Village_ArticleListModel *listModel = model.article_list[indexPath.row];
    
    ArtDetailViewController *vc = [[ArtDetailViewController alloc] init];
    vc.art_id =listModel.article_id;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark -- 分类按钮代理
- (void)clickInfoCategary:(NSInteger)index{
    _currenIndex = index;
    
    [self requestDataList];
}
#pragma mark -- 轮播图 FocusScrollViewDelegate
- (void)fScrollViewDidClicked:(NSInteger)index{
    Village_CarouselModel * model = self.carouselArray[index];
    
    WebViewController *webVC = [[WebViewController alloc] init];
//    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:webVC];
    webVC.urlString = model.link_url;
    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
    
}
#pragma mark -- InforAppButtonCellDelegate  按钮代理
- (void)clickInfoAppButton:(NSInteger)index{
    
    Village_AppButtonModel *model = self.appButtonArray[index];
    InforButtonCateController *vc = [[InforButtonCateController alloc] init];
    vc.cat_id = model.linkurl;
    vc.headTitle = model.title;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -- InforADDelegate 广告按钮
- (void)clickAD:(NSInteger)index{
    Village_ADModel * model = self.adArray[index];
    
    WebViewController *webVC = [[WebViewController alloc] init];
    webVC.headTitle = model.ad_name;
    webVC.urlString = model.link_url;
    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
