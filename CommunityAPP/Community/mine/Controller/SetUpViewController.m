//
//  SetUpViewController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2018/3/13.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SetUpViewController.h"
#import "SetUpTableViewCell.h"
#import "MyHarvestAddressVC.h"
#import "SetUpInfomationViewController.h"
#import "SetUpRequest.h"
#import "SetUpInfoModel.h"
#import "ChangePasswordVC.h"
#import "LoginRequest.h"
#import "YiJianFanKuiViewController.h"
#import "SafeJieBangViewController.h"
@interface SetUpViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray  * dataSourceArray;
@property(nonatomic,strong) NSArray  * rightLableArray;
@property(nonatomic, strong) SetUpInfoModel * infoModel;/** 信息模型*/
@end

@implementation SetUpViewController
    
- (void)viewWillAppear:(BOOL)animated{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self initData];
    //网络请求
    [self askServerData];
    
    
}

- (void)askServerData {
    SetUpRequest  *request = [[SetUpRequest alloc]init];
    [request setupRequestData];
    [request setFinishedBlock:^(id object, id responseData) {
        self.infoModel = object;
        [self.tableView reloadData];
    } failedBlock:^(NSInteger error, id responseData) {
       
    }];

    
    
}

-(void)initData{
    self.dataSourceArray = @[@[@""],@[@"我的收获地址"],@[@"手机",@"微信",@"密码"],@[@"推送设置"],@[@"清除本地缓存",@"意见反馈",@"关于我们",@"联系客服"]];
    self.rightLableArray = @[@[@""],@[@""],@[@"去绑定",@"去绑定",@"修改"],@[@""],@[@"1M",@"",@"",@""]];
}
-(void)setUpUI{
    self.title = @"设置";
    CustomBtn * quitBtn = [[CustomBtn alloc]initWithFrame:CGRectMake(0, self.view.height - GSANavHeight -45, HH_SCREEN_W, 45) Tag:0 Title:@"退出登录" backgroundColor:kColorRed TitleTextColor:kColorWhite Font:17 Image:nil];
    
    [quitBtn addTarget:self action:@selector(quitEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:quitBtn];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-GSANavHeight-45) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = kColorGray9;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[SetUpTableViewCell class] forCellReuseIdentifier:NSStringFromClass([SetUpTableViewCell class])];
    [self.view addSubview:self.tableView];
    
//    [quitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.view);
//        make.height.equalTo(@45);
//    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]init];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section == 3){
        return 40;
    }else{
        return 10;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]init];
    if(section == 3){
    NSString * string = @"如果你要关闭或开启消息通知，请在手机的“设置”-“通知”功能中，找到应用程序进行更改";
    CustomLab * titleLable = [[CustomLab alloc]initWithFrame:CGRectZero font:12.0 aligment:NSTextAlignmentLeft text:string textcolor:kColorGray11];
    titleLable.numberOfLines = 0;
    [headerView addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView.mas_left).offset(5);
        make.right.equalTo(headerView.mas_right).offset(-10);
        make.centerY.equalTo(headerView.mas_centerY).offset(0);
    }];
    }
    return headerView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier;
    if(indexPath.section == 0){
        identifier = kImageCellReuseIdentifier;
    }else if(indexPath.section == 3){
        identifier = kSwichCellReuseIdentifier;
    }else{
        identifier = kNormalCellReuseIdentifier;
    }
    SetUpTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[SetUpTableViewCell alloc] initWithReuseIdentifier:identifier indexPath:indexPath];
    }
    
    NSArray * array = self.dataSourceArray[indexPath.section];
    NSArray * rightArray = self.rightLableArray[indexPath.section];
    if (indexPath.section != 0){
        cell.leftLabel.text = array[indexPath.row];
        cell.rightLabel.text = rightArray[indexPath.row];
    }
    if (self.infoModel && indexPath.section == 2 &&indexPath.row == 1) {
        if (self.infoModel.wx_openid) {
            cell.rightLabel.text = @"解绑";
        }else {
            cell.rightLabel.text = @"未绑定";
        }
        //        [self.infoModel addObserver:cell forKeyPath:@"wx_openid" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
    
    if (self.infoModel && indexPath.section == 2 && indexPath.row == 0) {
        if (self.infoModel.mobile) {
            
            cell.rightLabel.text = self.infoModel.mobile;
        }else{
            cell.rightLabel.text = @"绑定手机";
        }
        
        
        
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){// 设置昵称
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SetUp" bundle:nil];
        SetUpInfomationViewController *setinfoVC = [sb instantiateViewControllerWithIdentifier:@"setupinfomation"];
        [self.navigationController pushViewController:setinfoVC animated:YES];
        
    }else if(indexPath.section == 1){// 收货地址
        MyHarvestAddressVC * VC = [[MyHarvestAddressVC alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.section == 2) {
        
        if (indexPath.row == 0) { // 手机
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SetUp" bundle:nil];
            SafeJieBangViewController *safeVC = [sb instantiateViewControllerWithIdentifier:@"safejiebang"];
            [self.navigationController pushViewController:safeVC animated:YES];
            
        }else if (indexPath.row == 1) {// 微信
            if (!self.infoModel.wx_openid) {// 绑定微信
                [[JTDSocialShare ShareUMSocial] getUserInfoWithController:self withTag:weChatLoginType callBack:^(BOOL success, JTDUserInfoModel *model) {
                    if(success){
                        [self thirdLoginWith:model loginType:weChatLoginType];
                    }else{
                        [self showToastHUD:@"登录异常" complete:nil];
                    }
                }];
            }
            
        }else if (indexPath.row == 2) {// 密码
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SetUp" bundle:nil];
            ChangePasswordVC *changeVC = [sb instantiateViewControllerWithIdentifier:@"changepassword"];
            [self.navigationController pushViewController:changeVC animated:YES];
        }
        
    }
    
    
    
    else if(indexPath.section == 4){
        if (indexPath.row == 0) {// 清除缓存
            [SVProgressHUD showWithStatus:@"正在清除"];
            [SVProgressHUD dismissWithDelay:1];
        }
        if (indexPath.row == 1) {
            YiJianFanKuiViewController *yjfk = [[YiJianFanKuiViewController alloc]init];
            [self.navigationController pushViewController:yjfk animated:YES];
        }
        if (indexPath.row == 2) {// 关于我们
            [self showHUDText:@"关于我们"];
        }
        if (indexPath.row == 3) {// 联系客服
            UIAlertController *al = [UIAlertController alertControllerWithTitle:@"联系客服"
                                                                        message:@"010-62342201"
                                                                 preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             
                                                         }];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:010-62342201"]options:@{}
                                                              
                                                                                    completionHandler:^(BOOL success) {
                                                                                        
                                                                                        
                                                                                    }];
                                                             
                                                
                                                             
                                                             
                                                         }];
            [al addAction:cancel];
            [al addAction:sure];
            
            [self presentViewController:al animated:YES completion:nil];
            
            
        }
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * array = self.dataSourceArray[section];
    return array.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataSourceArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if(indexPath.section != 0){
    return 56.0;
    }else{
        return 112;
    }
}

#pragma mark ---微信绑定

-(void)thirdLoginWith:(JTDUserInfoModel *)model loginType:(NSInteger )loginType{
    [self showHUDText:nil];
    JTDWeakSelf
    LoginRequest * request = [[LoginRequest alloc]init];
    [request setUserBangdingWXWithThirdOpen_id:model.openid union_id:model.unionId];
    [request setFinishedBlock:^(id object, id responseData) {
        [self hideHUD];
        if(responseData){
            [WeakSelf askServerData];
        }
    } failedBlock:^(NSInteger error, id responseData) {
        HHLog(@"%ld",error);
    }];
}

#pragma mark--退出登录
-(void)quitEvent:(CustomBtn *)sender{
    [[HHAlertView alloc]initWithTitle:@"退出登录" message:@"是否退出登录" showTarget:self handle:^(NSInteger index) {
        switch (index) {
            case 0:
            HHLog(@"取消");
            break;
            case 1:HHLog(@"确定");
            {
                [[HHComlient sharedInstance]clearMemory];
                [self.navigationController popViewControllerAnimated:YES];
                if(self.logOutcallBack){
                    self.logOutcallBack();
                }
                
            }
            break;
            
            default:
            break;
        }
    } cancle:@"取消" others:@"确定", nil];
    
    
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
