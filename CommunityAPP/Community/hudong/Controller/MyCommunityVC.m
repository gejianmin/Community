//
//  MyCommunityVC.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/28.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "MyCommunityVC.h"
#import "PubMyCommunityVC.h"
#import "SelectMyCommunityCell.h"
#import "NearCommunityRequest.h"

@interface MyCommunityVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * oa_tableView;
@property (nonatomic,strong) NSArray * sectionTitleArr;
@property (nonatomic, strong) NSMutableArray* rosterJIDs;
@property (nonatomic,strong) NSMutableArray * dataArr;
@property (nonatomic, strong) GetCommunityArrModel *model;
@end

@implementation MyCommunityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的小区";
    self.view.backgroundColor = kColorGray9;
    self.dataArr = [[NSMutableArray alloc]init];
    [self.view addSubview:self.oa_tableView];

    [self setUI];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestData];
}

-(UITableView *)oa_tableView{
    if (!_oa_tableView) {
        _oa_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, HH_SCREEN_W, HH_SCREEN_H-29) style:UITableViewStylePlain];
        _oa_tableView.delegate = self;
        _oa_tableView.dataSource = self;
        _oa_tableView.backgroundColor=kColorGray9;
        [_oa_tableView registerClass:[MyCommunityCell class] forCellReuseIdentifier:NSStringFromClass([MyCommunityCell class])];
    }
    return _oa_tableView;
}
- (void)requestData{
    [self showHUDText:nil];
    __weak typeof(self) tyself = self;
    [LoginViewController verificationTokenWithSuperViewController:self SuccessCallBack:^{
        GetCommunityRequest *request = [[GetCommunityRequest alloc] init];
        [request getCommunityListWithId:[[[HHComlient sharedInstance]user]uid]];
        [request setFinishedBlock:^(id object, id responseData) {
            [tyself hideHUD];
            tyself.model = object;
            [tyself.dataArr removeAllObjects];
            [tyself.dataArr addObjectsFromArray:tyself.model.getCommunityArray];
            [tyself.oa_tableView reloadData];
        } failedBlock:^(NSInteger error, id responseData) {
            [tyself hideHUD];
        }];
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

-(CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001f;
}
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0f;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectZero color:kColorRed];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectZero color:kColorGray9];
    CustomLab * title_lbl = [[CustomLab alloc]initWithFrame:CGRectMake(15, 15, HH_SCREEN_W, 20) font:15 aligment:NSTextAlignmentLeft text:@"猜你住在" textcolor:kColorGray];
    [headerView addSubview:title_lbl];
    return headerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 62.5;
}
#pragma mark-真实高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCommunityCell * cell =[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyCommunityCell class])];
    GetCommunityModel * model = self.dataArr[indexPath.row];
    cell.model = model;    
    return cell;
}
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    GetCommunityModel * model = self.dataArr[indexPath.row];
    if (self.callBack) {
        self.callBack(model);
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}
+(void)pushToMyCommunityViewController:(UIViewController *)superController callBack:(MyCommunityCallBack )callBack;{
    MyCommunityVC * VC = [[MyCommunityVC alloc]init];
    VC.callBack = callBack;
    [superController.navigationController pushViewController:VC animated:YES];
}
-(void)setUI{
    CustomBtn * enterBtn = [[CustomBtn alloc]initWithFrame:CGRectMake(0, HH_SCREEN_H-GSA_TabbarHeight-GSANavHeight, HH_SCREEN_W, 49) Tag:0 Title:@"立即入住" backgroundColor:kColorWhite TitleTextColor:kColorRed Font:15 Image:nil];
    [self.view addSubview:enterBtn];
    [enterBtn addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];
}
-(void)enter{
    
    PubMyCommunityVC * VC = [[PubMyCommunityVC alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
