//
//  MyHarvestAddressVC.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/20.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "MyHarvestAddressVC.h"
#import "MyHarvestAddressCell.h"
#import "AddAddressVC.h"

@interface MyHarvestAddressVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray  * dataSourceArray;
@property(nonatomic,strong) NSArray  * rightLableArray;

@end


@implementation MyHarvestAddressVC
- (void)viewWillAppear:(BOOL)animated{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self initData];
}
-(void)initData{
    self.dataSourceArray = @[@"手机",@"微信",@"密码",@"推送设置",@"清除本地缓存",@"意见反馈",@"关于我们",@"联系客服"];
}
-(void)setUpUI{
    self.title = @"设置";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-GSANavHeight-45) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = kColorGray9;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[MyHarvestAddressCell class] forCellReuseIdentifier:NSStringFromClass([MyHarvestAddressCell class])];
    [self.view addSubview:self.tableView];
    CustomBtn * quitBtn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:@"添加新地址" backgroundColor:kColorRed TitleTextColor:kColorWhite Font:17 Image:nil];
    [quitBtn addTarget:self action:@selector(quit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:quitBtn];
    [quitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@45);
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
    return 10;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]init];
    //    if(section == 3){
    //        NSString * string = @"如果你要关闭或开启消息通知，请在手机的“设置”-“通知”功能中，找到应用程序进行更改";
    //        CustomLab * titleLable = [[CustomLab alloc]initWithFrame:CGRectZero font:12.0 aligment:NSTextAlignmentLeft text:string textcolor:kColorGray11];
    //        titleLable.numberOfLines = 0;
    //        [headerView addSubview:titleLable];
    //        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.left.equalTo(headerView.mas_left).offset(5);
    //            make.right.equalTo(headerView.mas_right).offset(-10);
    //            make.centerY.equalTo(headerView.mas_centerY).offset(0);
    //        }];
    //    }
    return headerView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyHarvestAddressCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyHarvestAddressCell class])];
    cell.leftLabel.text = self.dataSourceArray[indexPath.row];
    if (indexPath.row == 0) {
        cell.isMoRen = YES;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
    
}
-(CGFloat )tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}
#pragma mark--添加新地址
-(void)quit:(CustomBtn *)sender{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SetUp" bundle:nil];
    AddAddressVC *addressVC = [sb instantiateViewControllerWithIdentifier:@"addaddressvc"];
    [self.navigationController pushViewController:addressVC animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
