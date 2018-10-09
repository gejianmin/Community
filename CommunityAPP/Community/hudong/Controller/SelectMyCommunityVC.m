//
//  SelectMyCommunityVC.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/28.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SelectMyCommunityVC.h"
#import "OASearchView.h"
#import "SelectMyCommunityCell.h"
#import "NearCommunityRequest.h"

@interface SelectMyCommunityVC ()<UITableViewDelegate,UITableViewDataSource,OASearchViewDelegate>

@property(nonatomic,strong)UITableView * oa_tableView;
@property (nonatomic,strong) NSArray * sectionTitleArr;
@property(nonatomic,strong) OASearchView  * searchView;
@property (nonatomic, strong) NSMutableArray* rosterJIDs;
@property (nonatomic,strong) NSMutableArray * dataArr;
@property (nonatomic, strong) NearCommunityModel *model;

@end

@implementation SelectMyCommunityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的小区";
    self.dataArr = [[NSMutableArray alloc]init];
    [self.view addSubview:self.oa_tableView];
    [self setNearVillageRequestWith:39.003332 log:166.9876];
}
-(UITableView *)oa_tableView{
    if (!_oa_tableView) {
        _oa_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, HH_SCREEN_W, HH_SCREEN_H-29) style:UITableViewStylePlain];
        _oa_tableView.delegate = self;
        _oa_tableView.dataSource = self;
        _oa_tableView.backgroundColor=kColorGray9;
 
        [_oa_tableView setTableHeaderView:[self tableViewHeaderView]];
        [_oa_tableView registerClass:[SelectMyCommunityCell class] forCellReuseIdentifier:NSStringFromClass([SelectMyCommunityCell class])];
    }
    return _oa_tableView;
}
- (void)setNearVillageRequestWith:(CGFloat)lat log:(CGFloat)log{
    
    __weak typeof(self) tyself = self;
    NearCommunityRequest *request = [[NearCommunityRequest alloc] init];
    [request setNearVillageWithlat:lat lng:log];
    [request setFinishedBlock:^(id object, id responseData) {
        
        NSLog(@"%@",object);
        tyself.model = object;
//        [tyself fullData:tyself.model.communityArray];
        [self.dataArr addObjectsFromArray:tyself.model.communityArray];
        [self.oa_tableView reloadData];
        
        
    } failedBlock:^(NSInteger error, id responseData) {
        NSLog(@"%ld",error);
    }];
    
}
-(UIView *)tableViewHeaderView{
    OASearchView * headerview = [[OASearchView alloc] initWithFrame:Frame(0, 0, HH_SCREEN_W, [OASearchView height]) placeholder:@"请输入小区名称" withDelegate:self];
    [headerview setBackgroundColor:kColorWhite];
    return headerview;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return self.dataArr.count;
}

-(CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001f;
}
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50.0f;
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
    SelectMyCommunityCell * cell =[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SelectMyCommunityCell class])];
//    NSArray * arr = [self.dataArr objectAtIndex:indexPath.section];
//    SelectMyCommunityCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SelectMyCommunityCell"];
//    if (cell==nil) {
//        cell=[[SelectMyCommunityCell alloc] initWithReuseIdentifier:@"SelectMyCommunityCell" indexPath:indexPath];
//    }
    CommunityModel * model = self.dataArr[indexPath.row];
    cell.title_lbl.text = model.org_name;
    cell.detailTitle_lbl.text = model.address;

    
    return cell;
}
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    CommunityModel * model = self.dataArr[indexPath.row];
    if (self.callBack) {
        self.callBack(model);
    }
    [self.navigationController popViewControllerAnimated:YES];

}
+(void)pushToSelectViewController:(UIViewController *)superController callBack:(callBack )callBack{
    SelectMyCommunityVC * VC = [[SelectMyCommunityVC alloc]init];
    VC.callBack = callBack;
    [superController.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
