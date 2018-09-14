//
//  PublicCircleController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/4.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "PublicCircleController.h"
#import "InforVillage_CarouselRequest.h"
#import "InforVillage_CarouselModel.h"
#import "WebViewController.h"
#import "PublicCircleCell.h"
#import "publicCircleList_Request.h"
#import "InForPublicCirCleList_Model.h"
@interface PublicCircleController ()<FocusScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView * gsa_collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout * layout;
@property (nonatomic, strong) NSMutableArray * datasourceArray;
@end

@implementation PublicCircleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self carouselRequest];
    [self publicCircleListRequest];
}
- (void)publicCircleListRequest{
    JTDWeakSelf
    publicCircleList_Request *request = [[publicCircleList_Request alloc] init];
    [request publicCircleList_sourceRequest];
    [request setFinishedBlock:^(id object, id responseData) {
        NSArray * list = [NSArray yy_modelArrayWithClass:[InForPublicCirCleList_Model class] json:responseData[@"data"]];
        [WeakSelf.datasourceArray removeAllObjects];
        [WeakSelf.datasourceArray addObjectsFromArray:list];
        [WeakSelf setupCollectionView];
        [WeakSelf.gsa_collectionView reloadData];
    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
    //返回section个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
    //每个section的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 7;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PublicCircleCell *cell = (PublicCircleCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PublicCircleCell class]) forIndexPath:indexPath];
    InForPublicCirCleList_Model *model = self.datasourceArray[indexPath.row];
    cell.model = model;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    InForPublicCirCleList_Model *model = self.datasourceArray[indexPath.row];
    WebViewController *webVC = [[WebViewController alloc] init];
    webVC.urlString = model.url;
//    webVC.customTitle = model.title;
    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
    {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
      //设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = 93;
    return CGSizeMake(width, width);
}
    
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        PublicCircleView * header_view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([PublicCircleView class]) forIndexPath:indexPath];
        reusableView = header_view;
    }
    if (kind == UICollectionElementKindSectionFooter)
    {
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        footerview.backgroundColor = kColorGray9;
        reusableView = footerview;
    }
    return reusableView;
}

//轮播图请求
- (void)carouselRequest{
    [self showHUDText:nil];
    __weak typeof(self) tyself = self;
    InforVillage_CarouselRequest *request = [[InforVillage_CarouselRequest alloc] init];
    
    NSString *ord_ID = [[HHClient sharedInstance] user].vid;
    [request InforVillage_CarouselRequestWithID:ord_ID];
    [request setFinishedBlock:^(id object, id responseData) {
        [self hideHUD];
        InforVillage_CarouselModel *model = object;
        tyself.carouselArray = [model.Village_CarouselArray mutableCopy];
    } failedBlock:^(NSInteger error, id responseData) {
        [self hideHUD];
        [self showToastHUD:@"服务器异常" complete:nil];
    }];
    [self setUpUI];
}
- (void)setCarouselArray:(NSArray *)carouselArray{
        _carouselArray = carouselArray;
        [self.focusScrollView updataImagesWithArray:carouselArray];
}
-(void )setupCollectionView{
    self.layout =[[UICollectionViewFlowLayout alloc]init];
    _gsa_collectionView =[[UICollectionView alloc]initWithFrame:Frame(0, 200, HH_SCREEN_W, HH_SCREEN_H) collectionViewLayout:self.layout];
    _gsa_collectionView.backgroundColor =[UIColor clearColor];
    [self.view addSubview:_gsa_collectionView];
    [_gsa_collectionView registerClass:[PublicCircleCell class] forCellWithReuseIdentifier:NSStringFromClass([PublicCircleCell class])];
    //注册header
    _gsa_collectionView.delegate = self;
    _gsa_collectionView.dataSource = self;
    _gsa_collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [_gsa_collectionView registerClass:[PublicCircleView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([PublicCircleView class])];
    [_gsa_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
    self.layout.headerReferenceSize = CGSizeMake(HH_SCREEN_W, [PublicCircleView heightDefault]);
    self.layout.footerReferenceSize = CGSizeMake(HH_SCREEN_W, HH_SCREEN_H-240-49);
}
-(void)setUpUI{
    self.focusScrollView = [[FocusScrollView alloc] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, 200) ContentSize:self.focusScrollView.frame.size];
    self.focusScrollView.delegate = self;
        [self.view addSubview:self.focusScrollView];
}
#pragma mark -- 轮播图 FocusScrollViewDelegate
- (void)fScrollViewDidClicked:(NSInteger)index{
    Village_CarouselModel * model = self.carouselArray[index];
    WebViewController *webVC = [[WebViewController alloc] init];
    webVC.urlString = model.link_url;
    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
}
-(NSMutableArray *)datasourceArray{
    if (!_datasourceArray) {
        _datasourceArray = [[NSMutableArray alloc]init];
    }
    return _datasourceArray;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
