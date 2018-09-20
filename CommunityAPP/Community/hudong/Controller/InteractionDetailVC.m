//
//  InteractionDetailVC.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/17.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "InteractionDetailVC.h"
#import "interactionDetailRequest.h"
#import "inter_commentListReqest.h"
#import "inter_commentHeaderView.h"
#import "inter_commentCell.h"
#import "inter_commentModel.h"
#import "JTDCommentView.h"
#import "MLPhoto.h"
#import "MLPhotoBrowserViewController.h"
@interface InteractionDetailVC ()<UITableViewDelegate,UITableViewDataSource,PDTopViewDelegate>
{
    NSString * _commentPid;
}
@property(nonatomic,strong) inter_commentHeaderView  * headerView;
@property(nonatomic,strong) UITableView  * tableView;
@property(nonatomic,strong) NSMutableArray  * headerDataSourceArray;
@property(nonatomic,strong) NSMutableArray  * dataSourceArray;
@property(nonatomic,strong)PSPersonSentView * commentsView;
@property(nonatomic, strong) NSMutableArray<MLPhoto *> * photos;
@end

@implementation InteractionDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    [self interactionDetailRequest];
    [self interCommentRequest];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
    self.commentsView = [[PSPersonSentView alloc]initWithFrame:CGRectMake(0, HH_SCREEN_H-GSA_TabbarHeight-GSANavHeight, HH_SCREEN_W , GSA_TabbarHeight) color:kColorWhite];
    self.commentsView.delegate = self;
    [self.view addSubview:self.commentsView];
}
#pragma mark--帖子详情
- (void)interactionDetailRequest{
    JTDWeakSelf
    interactionDetailRequest *request = [[interactionDetailRequest alloc] init];
    [request interactionDetailRequestWithID:self.model.pid];
    [request setFinishedBlock:^(id object, id responseData) {
        interactionDetailModel * model = [interactionDetailModel yy_modelWithJSON:responseData[@"data"]];
        WeakSelf.headerView.model = model;
        _commentPid = model.uid;
        [WeakSelf.headerDataSourceArray removeAllObjects];
        [WeakSelf.headerDataSourceArray addObjectsFromArray:model.images];
        [self.tableView reloadData];
    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]init];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section == 0){
        return 50;
    }else{
        return 10;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]init];
    if(section == 0){
        UIView * bgview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, HH_SCREEN_W, 10) color:kColorGray9];
        [headerView addSubview:bgview];
        NSString * string = @"留言：";
        CustomLab * titleLable = [[CustomLab alloc]initWithFrame:CGRectZero font:15.0 aligment:NSTextAlignmentLeft text:string textcolor:kColorBlack];
        [headerView addSubview:titleLable];
        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerView.mas_left).offset(15);
            make.right.equalTo(headerView.mas_right).offset(-10);
            make.centerY.equalTo(headerView.mas_centerY).offset(5);
        }];
    }
    return headerView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier;
    if(indexPath.section == 0){
        identifier = kNormalCellReuseIdentifier;
    }else{
        inter_commentCellModel * model = self.dataSourceArray[indexPath.row];
        identifier = model.cellType;
    }
    inter_commentCell * cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[inter_commentCell alloc] initWithReuseIdentifier:identifier indexPath:indexPath];
    }
    
    if (identifier == kNormalCellReuseIdentifier ){
        cell.headerModel = self.headerDataSourceArray[indexPath.row];
    }else{
        [cell setBackgroundColor:kColorGray9];
        cell.model = self.dataSourceArray[indexPath.row];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section != 0) {
        inter_commentCellModel * model = self.dataSourceArray[indexPath.row];
        if (![model.cellType isEqualToString:kCommentCellThirdReuseIdentifier]) {
            JTDWeakSelf
            [JTDCommentView presentViewWithMaxNumber:400 andContentCallback:^(NSString *content) {
                if (![NSObject isBlankString:content]) {
                    [WeakSelf interReplayCommentRequestWithCid:model.cid comment:content];
                }
            }];
        }
    }else if (indexPath.section == 0) {
        for (interactionDetailImageModel *model in self.headerDataSourceArray) {
            
            MLPhoto *photo = [[MLPhoto alloc]init];
            photo.thumbImageUrl = [NSURL URLWithString:model.img_src];
            photo.originalImageUrl = [NSURL URLWithString:model.img_src];
            [self.photos addObject:photo];
        }
        JTDWeakSelf
        MLPhotoBrowserViewController *browserVC = [[MLPhotoBrowserViewController alloc] init];
        browserVC.curPage = indexPath.row;/** 点击的第几张图片*/
        browserVC.photos = self.photos; //存的是myphoto的对象
        browserVC.hidesBottomBarWhenPushed = YES;
        [browserVC displayForVC:WeakSelf];
//        interactionDetailImageModel *model = self.headerDataSourceArray[indexPath.row];
        
        
    }
}
#pragma mark--直接发评论
-(void)sendButtonEventDelegateWithButton:(UIButton *)sender{
    if (sender.tag == 1001) {//评论
        [JTDCommentView presentViewWithMaxNumber:400 andContentCallback:^(NSString *content) {
            if (![NSObject isBlankString:content]) {
                [self interReplayCommentRequestWithCid:_commentPid comment:content];
            }else{
            }
        }];
    }else{//表情
    }
}
#pragma mark--回复评论
- (void)interReplayCommentRequestWithCid:(NSString *)cid comment:(NSString *)comment{
    inter_replayCommentListReqest *request = [[inter_replayCommentListReqest alloc] init];
    [request interReplayCommentListRequestWithID:cid comment:comment];
    [request setFinishedBlock:^(id object, id responseData) {
        JTDWeakSelf
        if ([responseData[@"status"] isEqualToString:successCode]) {
            [WeakSelf interCommentRequest];
        }else if ([responseData[@"status"] isEqualToString:failedCode]) {
            [self showToastHUD:responseData[@"error"][@"message"] complete:nil];
        }
    } failedBlock:^(NSInteger error, id responseData) {
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.headerDataSourceArray.count;
    }else{
        return self.dataSourceArray.count;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

#pragma mark-真实高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 220.0;
    }else{
        return UITableViewAutomaticDimension;
    }
}
-(CGFloat )tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 220.0;
    }else{
        return 100;
    }
}
#pragma mark--评论列表
- (void)interCommentRequest{
    [self showHUDText:nil];
    inter_commentListReqest *request = [[inter_commentListReqest alloc] init];
    [request interCommentListRequestWithID:self.model.pid];
    [request setFinishedBlock:^(id object, id responseData) {
        [self hideHUD];
        JTDWeakSelf
        if ([responseData[@"status"] isEqualToString:successCode]) {
            [WeakSelf.dataSourceArray removeAllObjects];
            inter_commentModel *model = object;
            NSArray * list = [model.data mutableCopy];
            for (int i = 0; i < list.count; i++) {
                inter_commentCellModel * tmodel = list[i];
                tmodel.cellType = kCommentCellFirstReuseIdentifier;
                [WeakSelf.dataSourceArray addObject:tmodel];
                if (tmodel.children.count > 0) {
                    for (int j = 0; j < tmodel.children.count; j++) {
                        inter_commentCellModel * cmodel = [inter_commentCellModel yy_modelWithJSON:tmodel.children[j]];
                        cmodel.cellType = kCommentCellSecondReuseIdentifier;
                        [WeakSelf.dataSourceArray addObject:cmodel];
                        if (cmodel.children.count > 0) {
                            for (int k = 0; k < cmodel.children.count; k++) {
                                inter_commentCellModel * dmodel = [inter_commentCellModel yy_modelWithJSON:cmodel.children[k]];
                                dmodel.cellType = kCommentCellThirdReuseIdentifier;
                                [WeakSelf.dataSourceArray addObject:dmodel];
                            }
                        }
                    }
                }
            }
            [WeakSelf.tableView reloadData];
        }else if ([responseData[@"status"] isEqualToString:failedCode]) {
            [self showToastHUD:responseData[@"error"][@"message"] complete:nil];
        }
    } failedBlock:^(NSInteger error, id responseData) {
    }];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView setTableHeaderView:[self tableViewHeaderView]];
        [_tableView registerClass:[inter_commentCell class] forCellReuseIdentifier:NSStringFromClass([inter_commentCell class])];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        
    }
    return _tableView;
}
-(UIView *)tableViewHeaderView{
    self.headerView = [[inter_commentHeaderView alloc]initWithFrame:CGRectMake(0, 0, HH_SCREEN_W, 130) color:kColorWhite];
    return self.headerView;
}
-(NSMutableArray *)headerDataSourceArray{
    if (!_headerDataSourceArray) {
        _headerDataSourceArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _headerDataSourceArray;
}
-(NSMutableArray *)dataSourceArray{
    if (!_dataSourceArray) {
        _dataSourceArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataSourceArray;
}

- (NSMutableArray<MLPhoto *> *)photos {
    
    if (!_photos) {
        _photos = [[NSMutableArray alloc ] init];
    }
    return _photos;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
