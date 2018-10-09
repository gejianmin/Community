//
//  PubMyCommunityVC.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/28.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "PubMyCommunityVC.h"
#import "GSAPublishCell.h"
#import "GSAPublishModel.h"
#import "SelectMyCommunityVC.h"
#import "NearCommunityRequest.h"
@interface PubMyCommunityVC ()<UITableViewDelegate,UITableViewDataSource,GSAPublishButtonDelegate>

@property (nonatomic, strong) NSMutableArray  *dataSourceItemsArray;
@property(nonatomic,strong)UITableView * ps_tableView;

@end

@implementation PubMyCommunityVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"申请入住小区";
    [self addRightBarItemWithTitle:@"申请" tintColor:kColorBlack backgroudColor:kColorGray9 target:self action:@selector(publishEvent)];
    [self.view addSubview:self.ps_tableView];
    [self reloadArrayData];
}

-(void)reloadArrayData{
    
    self.dataSourceArray = [NSMutableArray arrayWithArray:@[
                                                            [[GSAPublishModel alloc] initWithTitle:@"小区名" detailTitle:@"请选择小区" reuseIdentifier:kImageCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:selectorSelectStatu content:@"" contentID:@"" titleName:@"" selecStyle:selectDateStyle],
                                                            [[GSAPublishModel alloc] initWithTitle:@"楼栋号" detailTitle:@"请输入楼栋号（如A10或10）" reuseIdentifier:kNormalCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:selectorInputStatu content:@"" contentID:@"" titleName:@"building" selecStyle:selectDateStyle],
                                                            [[GSAPublishModel alloc] initWithTitle:@"单元号" detailTitle:@"请输入单元号（无单元号 输入0）" reuseIdentifier:kNormalCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:selectorInputStatu content:@"" contentID:@"" titleName:@"entrance" selecStyle:selectToPlaceStyle],
                                                            [[GSAPublishModel alloc] initWithTitle:@"门牌号" detailTitle:@"请输入门牌号（如102）" reuseIdentifier:kNormalCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:selectorInputStatu content:@"" contentID:@"" titleName:@"house_number" selecStyle:selectInterestStyle],
                                                            [[GSAPublishModel alloc] initWithTitle:@"联系人" detailTitle:@"" reuseIdentifier:kButtonCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:segmentShowCustomStyle content:[[[HHComlient sharedInstance]user]mobile] contentID:[[[HHComlient sharedInstance]user]mobile] titleName:@"contact" selecStyle:selectThemeStyle],
                                                            [[GSAPublishModel alloc] initWithTitle:@"手机号" detailTitle:@"" reuseIdentifier:kButtonCellReuseIdentifier buttonTitle:@"" isHeidenMark:1 selectorStatu:segmentShowCustomStyle content:[[[HHComlient sharedInstance]user]mobile] contentID:[[[HHComlient sharedInstance]user]mobile] titleName:@"mobile" selecStyle:0],
                                                            ]];
    
}
- (UITableView *)ps_tableView{
    if (_ps_tableView == nil) {
        _ps_tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, HH_SCREEN_W, HH_SCREEN_H-GSA_TabbarHeight) style:UITableViewStyleGrouped];
        _ps_tableView.delegate = self;
        _ps_tableView.dataSource = self;
        _ps_tableView.tag = 2;
        [_ps_tableView setBackgroundColor:kColorGray9];
        [_ps_tableView registerClass:[GSAPublishCell class] forCellReuseIdentifier:NSStringFromClass([GSAPublishCell class])];
    }
    return _ps_tableView;
}
-(NSMutableArray*)dataSourceArray{
    if (_dataSourceArray == nil) {
        _dataSourceArray = [[NSMutableArray alloc]init];
    }
    return _dataSourceArray;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]init];
    return headerView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 62.5;
//}
#pragma mark-真实高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    return UITableViewAutomaticDimension;
    return 55.0;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GSAPublishModel * model = self.dataSourceArray[indexPath.row];
    GSAPublishCell *cell=[tableView dequeueReusableCellWithIdentifier:model.reuseIdentifier];
    if (cell==nil) {
        cell=[[GSAPublishCell alloc] initWithReuseIdentifier:model.reuseIdentifier indexPath:indexPath];
    }
    cell.model = model;
    cell.delegate = self;
    [cell reloadDataWithModel:model indexPath:indexPath callBack:^(NSString *content, NSIndexPath *indexPath) {
        [self reloadDataWithContent:content andContentID:content indexPath:indexPath];
    }];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GSAPublishModel * model = self.dataSourceArray[indexPath.row];
    JTDWeakSelf
    if (model.selecStyle == selectDateStyle ) {
        [SelectMyCommunityVC pushToSelectViewController:self callBack:^(CommunityModel *model) {
            [WeakSelf reloadDataWithContent:model.org_name andContentID:model.vid indexPath:indexPath];
        }];
    }
}
- (void)reloadDataWithContent:(NSString * )content andContentID:(NSString *)contentID indexPath:(NSIndexPath *)indexPath {
    GSAPublishModel * model = _dataSourceArray[indexPath.row];
    model.content = content;
    model.contentID = contentID;
    [_dataSourceArray replaceObjectAtIndex:indexPath.row withObject:model];
    if (model.selectorStatu == selectorSelectStatu) {
        [self.ps_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}
#pragma mark--申请
-(void)publishEvent{
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    NSMutableArray * array = [[NSMutableArray alloc]init];
    for (int i = 0; i < self.dataSourceArray.count; i++) {
        GSAPublishModel * model = self.dataSourceArray[i];
        if ([NSObject isBlankString:model.content]) {
            [self showToastHUD:[NSString stringWithFormat:@"%@",model.detailTitle]];
            return;
        }
        [array addObject:model.content];
        if (![model.content isEqualToString:model.contentID]) {
            [dict setObject:model.contentID forKey:@"vid"];
        }else{
            [dict setObject:model.content forKey:model.titleName];
        }
    }
    [dict setObject:[[[HHComlient sharedInstance]user]uid] forKey:@"uid"];
    [dict setObject:@"100" forKey:@"floor_space"];
    [dict setObject:@"1" forKey:@"have_parking"];
    [dict setObject:@"521S2" forKey:@"parking_number"];
    [dict setObject:@"12433" forKey:@"plate_number"];
    
    PubCommunityRequest *request = [[PubCommunityRequest alloc] init];
    [request enterCommunityWithInfo:dict];
    [request setFinishedBlock:^(id object, id responseData) {
        if (responseData) {
            if ([responseData[@"status"] isEqualToString:successCode]) {
                [self showToastHUD:@"申请成功" complete:^{
                    [self.navigationController popViewControllerAnimated:YES];
                }];
            }
        }
        
        
    } failedBlock:^(NSInteger error, id responseData) {
        NSLog(@"%ld",error);
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
