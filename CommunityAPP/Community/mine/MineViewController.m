//
//  MineViewController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/4.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "MineViewController.h"
#import "PostActivityListController.h"
#import "MessageCenterController.h"
#import "SetUpViewController.h"
#import "LayerButton.h"
#import "LayoutButton.h"
@interface MineViewController ()

@property (nonatomic,strong) UIView *headView;
@property (nonatomic,strong) UIImageView *headImgView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *jifenLabel;

@property (nonatomic,strong) UILabel *yuer;
@property (nonatomic,strong) UILabel *yuerLabel;
@property (nonatomic,strong) UILabel *shoucang;
@property (nonatomic,strong) UILabel *shoucangLabel;
@property (nonatomic,strong) UILabel *hongbao;
@property (nonatomic,strong) UILabel *hongbaoLabel;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self.navBar setRightItemWithTarget:self action:@selector(setUp) normalImage:[UIImage imageNamed:@"set"] selectedImage:[UIImage imageNamed:@"set"]];

    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [self.view addSubview:self.headView];
    self.headView.backgroundColor = [UIColor redColor];
    
    self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 60, 60)];
    self.headImgView.backgroundColor = [UIColor grayColor];
    self.headImgView.layer.cornerRadius = 30.f;
    self.headImgView.layer.masksToBounds = YES;
    [self.headView addSubview:self.headImgView];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImgView.right + 10, 0, 200, 16)];
    self.nameLabel.text = @"点击登录";
    self.nameLabel.centerY =self.headImgView.centerY;
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.font = FONT(15);
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    [self.headView addSubview:self.nameLabel];
    
    UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 110, 0, 300, 32)];
    [self.headView addSubview:alphaView];
    alphaView.backgroundColor = [UIColor whiteColor];
    alphaView.alpha = 0.6;
    alphaView.layer.cornerRadius = 16.0;
    alphaView.layer.masksToBounds = YES;
    alphaView.clipsToBounds = YES;
    alphaView.centerY =self.headImgView.centerY;

    self.jifenLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 100, 0, 300, 20)];
    self.jifenLabel.text = @"签到积分300";
    self.jifenLabel.textColor = [UIColor whiteColor];
    self.jifenLabel.font = FONT(15);
    self.jifenLabel.clipsToBounds = YES;
    [self.headView addSubview:self.jifenLabel];
    self.jifenLabel.centerY =self.headImgView.centerY;
    
    self.yuerLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, self.headView.bottom + 10, 80, 15)];
    self.yuerLabel.text = @"12345.元";
    self.yuerLabel.textColor = [UIColor blackColor];
    self.yuerLabel.font = FONT(14);
    [self.view addSubview:self.yuerLabel];
    self.yuerLabel.textAlignment = NSTextAlignmentCenter;
    CGSize size =  [self.yuerLabel sizeForString:self.yuerLabel.text font:self.yuerLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 15)];
    self.yuerLabel.width = size.width;
    
    self.yuer = [[UILabel alloc] initWithFrame:CGRectMake(60, self.headView.bottom + 10, 30, 15)];
    self.yuer.text = @"余额";
    self.yuer.textColor = [UIColor blackColor];
    self.yuer.font = FONT(14);
    [self.view addSubview:self.yuer];
    self.yuerLabel.textAlignment = NSTextAlignmentCenter;
    self.yuer.top = self.yuerLabel.bottom + 5;
    self.yuer.centerX = SCREEN_WIDTH/6;
    self.yuerLabel.centerX =self.yuer.centerX;

    self.shoucangLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, self.headView.bottom + 10, 80, 15)];
    self.shoucangLabel.text = @"1234";
    self.shoucangLabel.textColor = [UIColor blackColor];
    self.shoucangLabel.font = FONT(14);
    [self.view addSubview:self.shoucangLabel];
    self.shoucangLabel.textAlignment = NSTextAlignmentCenter;
    CGSize shoucangsize =  [self.shoucangLabel sizeForString:self.shoucangLabel.text font:self.shoucangLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 15)];
    self.shoucangLabel.width = shoucangsize.width;
    
    self.shoucang = [[UILabel alloc] initWithFrame:CGRectMake(60, self.headView.bottom + 10, 30, 15)];
    self.shoucang.text = @"收藏";
    self.shoucang.textColor = [UIColor blackColor];
    self.shoucang.font = FONT(14);
    [self.view addSubview:self.shoucang];
    self.shoucang.textAlignment = NSTextAlignmentCenter;
    self.shoucang.top = self.shoucangLabel.bottom + 5;
    self.shoucang.centerX = SCREEN_WIDTH/2;
    self.shoucangLabel.centerX =self.shoucang.centerX;
    
    self.hongbaoLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, self.headView.bottom + 10, 80, 15)];
    self.hongbaoLabel.text = @"1234";
    self.hongbaoLabel.textColor = [UIColor blackColor];
    self.hongbaoLabel.font = FONT(14);
    [self.view addSubview:self.hongbaoLabel];
    self.hongbaoLabel.textAlignment = NSTextAlignmentCenter;
    CGSize hongbaosize =  [self.hongbaoLabel sizeForString:self.hongbaoLabel.text font:self.hongbaoLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 15)];
    self.hongbaoLabel.width = hongbaosize.width;
    
    self.hongbao = [[UILabel alloc] initWithFrame:CGRectMake(60, self.headView.bottom + 10, 60, 15)];
    self.hongbao.text = @"抢到红包";
    self.hongbao.textColor = [UIColor blackColor];
    self.hongbao.font = FONT(14);
    [self.view addSubview:self.hongbao];
    self.hongbao.textAlignment = NSTextAlignmentCenter;
    self.hongbao.top = self.hongbaoLabel.bottom + 5;
    self.hongbao.centerX = SCREEN_WIDTH/6*5;
    self.hongbaoLabel.centerX =self.hongbao.centerX;
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.shoucang.bottom + 10, SCREEN_WIDTH, 15)];
    lineView.backgroundColor = RGB(220, 220, 220);
    [self.view addSubview:lineView];
    
    UIImageView *dingdanImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, lineView.bottom + 15, 35, 35)];
    dingdanImgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:dingdanImgView];
    
    UILabel *dingdanLabel = [[UILabel alloc] initWithFrame:CGRectMake(dingdanImgView.right + 5, self.headView.bottom + 10, 60, 15)];
    dingdanLabel.text = @"我的订单";
    dingdanLabel.textColor = [UIColor blackColor];
    dingdanLabel.font = FONT(14);
    [self.view addSubview:dingdanLabel];
    dingdanLabel.textAlignment = NSTextAlignmentLeft;
    dingdanLabel.centerY = dingdanImgView.centerY;
    
    UILabel *allLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 80, self.headView.bottom + 10, 60, 15)];
    allLabel.text = @"查看全部";
    allLabel.textColor = [UIColor grayColor];
    allLabel.font = FONT(14);
    [self.view addSubview:allLabel];
    allLabel.textAlignment = NSTextAlignmentCenter;
    allLabel.centerY = dingdanImgView.centerY;
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, dingdanImgView.bottom + 10, SCREEN_WIDTH, 1.f)];
    line1.backgroundColor = RGB(220, 220, 220);
    [self.view addSubview:line1];
    
    CGFloat currentH = line1.bottom;
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"待付款",@"待发/收货",@"待使用",@"待评价",@"售后", nil];
    NSArray *imgArray = [NSArray arrayWithObjects:@"daizhifu",@"shouhou",@"daishiyong",@"daipingjia",@"shouhou", nil];
    for (int i = 0; i<5; i++) {
        
        NSString *title = titleArray[i];
        NSString *imgTitle =imgArray[i];
        
        LayoutButton *button = [LayoutButton initWithLayoutButton:imgTitle title:title font:13];
        NSLog(@"111");
        button.frame = CGRectMake(self.view.width/5*i, currentH, self.view.width/5, 70);
        NSLog(@"222");
//        [button setImage:[UIImage imageNamed:imgTitle] forState:UIControlStateNormal];
//        [button setTitle:title forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        button.titleLabel.font = FONT(13);
//        button.titleLabel.textAlignment = NSTextAlignmentCenter;
//
//        button.imageEdgeInsets = UIEdgeInsetsMake(-button.height/2, 0, 0, -button.width/2);
//        button.titleEdgeInsets = UIEdgeInsetsMake(button.height/2 - 10, 0, 0, 20);
        [self.view addSubview:button];
        button.tag = 100 + i;
        [button addTarget:self action:@selector(myOrder:) forControlEvents:UIControlEventTouchUpInside];
//
//        CGFloat button_centerX = button.width/2; //等同于 CGRectGetMidX(self.bounds);// bounds哦
//        CGFloat titleLabel_centerX =CGRectGetMidX(button.titleLabel.frame);
//        CGFloat imageView_centerX =CGRectGetMidX(button.imageView.frame);
//        button.imageEdgeInsets = UIEdgeInsetsMake(0,0 + (button_centerX - imageView_centerX),0,0 - (button_centerX - imageView_centerX));
//        button.titleEdgeInsets = UIEdgeInsetsMake(0,0 - (titleLabel_centerX - button_centerX),0, 0 + (titleLabel_centerX - button_centerX));

        if (i == 4) {
            currentH = button.bottom;
        }
    }
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, currentH, SCREEN_WIDTH, 10.f)];
    line2.backgroundColor = RGB(220, 220, 220);
    [self.view addSubview:line2];
    
    currentH = line2.bottom + 10;
    
    NSArray *titleArray1 = [NSArray arrayWithObjects:@"购物车",@"发布活动",@"消息中心",@"积分商城", nil];
    NSArray *imgArray1 = [NSArray arrayWithObjects:@"gouwuche",@"fabuhuodong",@"xiaoxizhongxin",@"jifenshangcheng", nil];
    for (int i = 0; i<titleArray1.count; i++) {
        
        NSString *title = titleArray1[i];
        NSString *imgTitle =imgArray1[i];
        
        LayoutButton *button = [LayoutButton initWithLayoutButton:imgTitle title:title font:13];
        button.frame = CGRectMake(self.view.width/titleArray1.count*i, currentH, self.view.width/titleArray1.count, 70);

        [self.view addSubview:button];
        button.tag = 1000 + i;
        [button addTarget:self action:@selector(orderList:) forControlEvents:UIControlEventTouchUpInside];
        
        
        if (i == titleArray1.count - 1) {
            currentH = button.bottom;
        }
    }
    
    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(0, currentH, SCREEN_WIDTH, 10.f)];
    line3.backgroundColor = RGB(220, 220, 220);
    [self.view addSubview:line3];
    
    currentH = line3.bottom + 10;

    NSArray *titleArray2 = [NSArray arrayWithObjects:@"优惠券",@"联系我们",@"邀请好友", nil];
    NSArray *imgArray2 = [NSArray arrayWithObjects:@"youhuiquan",@"lianxiwomen",@"yaoqinghaoyou", nil];
    for (int i = 0; i<titleArray2.count; i++) {
        
        NSString *title = titleArray2[i];
        NSString *imgTitle =imgArray2[i];
        
        LayoutButton *button = [LayoutButton initWithLayoutButton:imgTitle title:title font:13];
        button.frame = CGRectMake(self.view.width/titleArray1.count*i, currentH, self.view.width/titleArray1.count, 70);
        
        [self.view addSubview:button];
        
        if (i == titleArray1.count - 1) {
            currentH = button.bottom;
        }
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(shareSuccess) name:kUMengShareNotification object:nil];
}
#pragma mark--分享
-(void)shareEvent{
    JTDShareVC *share = [[JTDShareVC alloc]init];
    JTDShareContent * model = [[JTDShareContent alloc]init];
    model.centent = @"赵万里";
    model.name = @"万里无云";
    model.images = @"icon";
    share.shareContentModel = model;
    [share showPaySuccessWithResult:PayStateShare andController:self];
}
#pragma mark--分享成功
-(void)shareSuccess{
    [self showToastHUD:@"分享成功" complete:nil];
}
- (void)orderList:(UIButton *)sender{
    switch (sender.tag - 1000) {
        case 0:
        [self shareEvent];
            break;
        case 1:
        {
            //发布活动
            PostActivityListController *vc = [[PostActivityListController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            //消息中心
            MessageCenterController *vc = [[MessageCenterController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
            
            break;
        default:
            break;
    }
}
- (void)setUp{
    SetUpViewController *vc = [[SetUpViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)myOrder:(UIButton *)sender{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}


@end
