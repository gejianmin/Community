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

@interface InterButtonCateController ()<SGPageTitleViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *cateArray;
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation InterButtonCateController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(240, 240, 240);
    
    self.tableView.frame = CGRectMake(0, 64 + 52, SCREEN_WIDTH, SCREEN_HEIGHT - 52 - 64);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _currentIndex = 0;
    
    [self setLeftItemWithImageTarget:self];
    self.title = self.headTitle;
    
    [self setCateGaryRequest];
    
    [self addRefreshHeaderView];
    [self addRefreshFooterView];
}
- (void)refreshData
{
    InterArtListTool *tool = self.listArray[_currentIndex];
    tool.status = RequestMode_Rrefresh;
    
    [self requestDataList];
}
- (void)getMoreData
{
    InterArtListTool *tool = self.listArray[_currentIndex];
    tool.status = RequestMode_LoadMore;
    
    [self requestDataList];
}
//分类请求
- (void)requestDataList{
    __weak typeof(self) tyself = self;
    
    InterArtListTool *tool = self.listArray[_currentIndex];
    
    [tool inforVillage_ListRequestSuccess:^(id object) {
        
        [tyself.tableView reloadData];
        [tyself.tableView.mj_footer endRefreshing];
        [tyself.tableView.mj_header endRefreshing];
    } fail:^{
        
        [tyself.tableView.mj_footer endRefreshing];
        [tyself.tableView.mj_header endRefreshing];
    }];
}
- (void)setCateGaryRequest{
    
    __weak typeof(self) tyself = self;
    Inter_categaryRequest *request = [[Inter_categaryRequest alloc] init];
    [request InfoArt_categaryRequestWithCat_ID:self.cat_id];
    [request setFinishedBlock:^(id object, id responseData) {
        
        InterButton_categaryModel *model = object;
        tyself.cateArray = [model.data mutableCopy];
        if (tyself.cateArray.count>0) {
            
            [tyself setSGpage];
            //创建模型
            for (int i = 0; i<tyself.cateArray.count; i++) {
                
                Inter_categaryModel *cateModel = tyself.cateArray[i];
                
                InterArtListTool *tool = [[InterArtListTool alloc] init];
                tool.currentIndex = i;
                tool.cat_id = cateModel.topic_id;
                tool.pageIndex = 1;//要请求的页码数
                [tyself.listArray addObject:tool];
            }
            
            //            //默认请求第一个分类数据
            //            [tyself requestDataList];
            
            
        }
        
    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
- (void)setSGpage{
    
    NSMutableArray *titleArray = [NSMutableArray array];
    for (Inter_categaryModel *model in self.cateArray) {
        [titleArray addObject:model.topic_name];
    }
    
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = [UIColor blackColor];
    configure.spacingBetweenButtons = 30.f;
    configure.titleFont = FONT(14);
    configure.titleSelectedColor = [UIColor redColor];
    configure.indicatorColor = [UIColor redColor];
    
    SGPageTitleView *pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(2.0f, 64, SCREEN_WIDTH, 50) delegate:self titleNames:titleArray configure:configure];
    pageTitleView.backgroundColor = [UIColor whiteColor];
    pageTitleView.isShowBottomSeparator = NO;
    pageTitleView.isNeedBounces = NO;
    pageTitleView.offSetAnimated = YES;
    pageTitleView.selectedIndex = 0;
    
    [self.view addSubview:pageTitleView];
}
#pragma mark -- SGPageTitleViewDelegate
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    _currentIndex = selectedIndex;
    
    InterArtListTool *tool = self.listArray[selectedIndex];
    if (tool.dataArray.count<=0 & tool.reqStatus != RequestStatus_Responding) {
        
        [self.tableView.mj_header beginRefreshing];
    }else{
        //        if (tool.reqStatus == RequestStatus_Responding) {
        //            [self.tableView.mj_footer beginRefreshing];
        //        }else{
        //            [self.tableView.mj_footer endRefreshing];
        //
        //        }
        [self.tableView reloadData];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.listArray.count>0) {
        InterArtListTool *tool = self.listArray[_currentIndex];
        return tool.dataArray.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"InterListCell";
    InterListCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[InterListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    InterArtListTool *tool = self.listArray[_currentIndex];
    cell.model = tool.dataArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    InfoArtListTool *tool = self.listArray[_currentIndex];
//    Village_ArticleListModel *model = tool.dataArray[indexPath.row];
//
//    ArtDetailViewController *vc = [[ArtDetailViewController alloc] init];
//    vc.art_id =model.article_id;
//    [self.navigationController pushViewController:vc animated:YES];
    
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
