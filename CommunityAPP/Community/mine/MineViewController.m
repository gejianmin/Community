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
#import "WebViewController.h"
#import "MacroNetwork.h"
@interface MineViewController ()
    
    @property (nonatomic,strong) UIView *headView;
    @property (nonatomic,strong) UIImageView *headImgView;
    @property (nonatomic,strong) UILabel *nameLabel;
    @property (nonatomic,strong) CustomBtn *loginBtn;
    @property (nonatomic,strong) CustomBtn *settingBtn;
    
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
    
    //注册KVO 方便别处监听昵称、头像的变化
    [[HHComlient sharedInstance].user addObserver:self
                                       forKeyPath:@"nickname"
                                          options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew
                                          context:nil];
    [[HHComlient sharedInstance].user addObserver:self
                                       forKeyPath:@"face"
                                          options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew
                                          context:nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    [self.navBar setRightItemWithTarget:self action:@selector(setUp) normalImage:[UIImage imageNamed:@"set"] selectedImage:[UIImage imageNamed:@"set"]];
    [self addRightBarItemWithImage:ImageNamed(@"set") target:self action:@selector(setUp)];
    
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [self.view addSubview:self.headView];
    self.headView.backgroundColor = [UIColor redColor];
    
    self.settingBtn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:nil backgroundColor:kColorClear TitleTextColor:kColorWhite Font:15.0 Image:ImageNamed(@"set")];
    
    
    [self.settingBtn addTarget:self action:@selector(setUp) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:self.settingBtn];
    [self.settingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headView.mas_top).offset(15);
        make.right.equalTo(self.headView.mas_right).offset(0);
        make.width.height.equalTo(@50);
        
    }];
    
    // 头像
    self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 70, 80, 80)];
    self.headImgView.backgroundColor = [UIColor whiteColor];
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:[HHComlient sharedInstance].user.face] placeholderImage:nil];
    self.headImgView.layer.cornerRadius = 40.f;
    self.headImgView.layer.masksToBounds = YES;
    [self.headView addSubview:self.headImgView];
    
    //    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImgView.right + 10, 0, 200, 16)];
    //    self.nameLabel.text = @"点击登录";
    //    self.nameLabel.centerY =self.headImgView.centerY;
    //    self.nameLabel.textColor = [UIColor whiteColor];
    //    self.nameLabel.font = FONT(15);
    //    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    //    [self.headView addSubview:self.nameLabel];
    
    self.loginBtn = [[CustomBtn alloc]initWithFrame:CGRectMake(self.headImgView.right + 10, 0, 200, 16) Tag:0 Title:@"点击登录" backgroundColor:kColorClear TitleTextColor:kColorWhite Font:18.0 Image:nil];
    self.loginBtn.centerY = self.headImgView.centerY;
    self.loginBtn.left = self.headImgView.right + 10;
    self.loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.loginBtn addTarget:self action:@selector(loginBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:self.loginBtn];
    [self loginState];
    UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 110, 0, 300, 32)];
    [self.headView addSubview:alphaView];
    alphaView.backgroundColor = [UIColor whiteColor];
    alphaView.alpha = 0.6;
    alphaView.layer.cornerRadius = 16.0;
    alphaView.layer.masksToBounds = YES;
    alphaView.clipsToBounds = YES;
    alphaView.centerY =self.headImgView.centerY;
    
    self.jifenLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 100, 0, 300, 20)];
    self.jifenLabel.text = [HHComlient sharedInstance].user.coin?:@"";
    self.jifenLabel.textColor = [UIColor whiteColor];
    self.jifenLabel.font = FONT(15);
    self.jifenLabel.clipsToBounds = YES;
    [self.headView addSubview:self.jifenLabel];
    self.jifenLabel.centerY =self.headImgView.centerY;
    
    self.yuerLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, self.headView.bottom + 25, 80, 15)];
    self.yuerLabel.text = @"0.00";
    self.yuerLabel.textColor = [UIColor blackColor];
    self.yuerLabel.font = FONT(14);
    [self.view addSubview:self.yuerLabel];
    self.yuerLabel.textAlignment = NSTextAlignmentCenter;
    CGSize size =  [self.yuerLabel sizeForString:self.yuerLabel.text font:self.yuerLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 15)];
    self.yuerLabel.width = size.width;
    
    self.yuer = [[UILabel alloc] initWithFrame:CGRectMake(60, self.headView.bottom + 25, 30, 15)];
    self.yuer.text = @"余额";
    self.yuer.textColor = [UIColor blackColor];
    self.yuer.font = FONT(14);
    [self.view addSubview:self.yuer];
    self.yuerLabel.textAlignment = NSTextAlignmentCenter;
    self.yuer.top = self.yuerLabel.bottom + 5;
    self.yuer.centerX = SCREEN_WIDTH/6;
    self.yuerLabel.centerX =self.yuer.centerX;
    
    self.shoucangLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, self.headView.bottom + 25, 80, 15)];
    self.shoucangLabel.text = @"0";
    self.shoucangLabel.textColor = [UIColor blackColor];
    self.shoucangLabel.font = FONT(14);
    [self.view addSubview:self.shoucangLabel];
    self.shoucangLabel.textAlignment = NSTextAlignmentCenter;
    CGSize shoucangsize =  [self.shoucangLabel sizeForString:self.shoucangLabel.text font:self.shoucangLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 15)];
    self.shoucangLabel.width = shoucangsize.width;
    
    self.shoucang = [[UILabel alloc] initWithFrame:CGRectMake(60, self.headView.bottom + 25, 30, 15)];
    self.shoucang.text = @"收藏";
    self.shoucang.textColor = [UIColor blackColor];
    self.shoucang.font = FONT(14);
    [self.view addSubview:self.shoucang];
    self.shoucang.textAlignment = NSTextAlignmentCenter;
    self.shoucang.top = self.shoucangLabel.bottom + 5;
    self.shoucang.centerX = SCREEN_WIDTH/2;
    self.shoucangLabel.centerX =self.shoucang.centerX;
    
    self.hongbaoLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, self.headView.bottom + 25, 80, 15)];
    self.hongbaoLabel.text = @"0";
    self.hongbaoLabel.textColor = [UIColor blackColor];
    self.hongbaoLabel.font = FONT(14);
    [self.view addSubview:self.hongbaoLabel];
    self.hongbaoLabel.textAlignment = NSTextAlignmentCenter;
    CGSize hongbaosize =  [self.hongbaoLabel sizeForString:self.hongbaoLabel.text font:self.hongbaoLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 15)];
    self.hongbaoLabel.width = hongbaosize.width;
    
    self.hongbao = [[UILabel alloc] initWithFrame:CGRectMake(60, self.headView.bottom + 25, 60, 15)];
    self.hongbao.text = @"抢到红包";
    self.hongbao.textColor = [UIColor blackColor];
    self.hongbao.font = FONT(14);
    [self.view addSubview:self.hongbao];
    self.hongbao.textAlignment = NSTextAlignmentCenter;
    self.hongbao.top = self.hongbaoLabel.bottom + 5;
    self.hongbao.centerX = SCREEN_WIDTH/6*5;
    self.hongbaoLabel.centerX =self.hongbao.centerX;
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.shoucang.bottom + 25, SCREEN_WIDTH, 10)];
    lineView.backgroundColor = kColorGray9;
    [self.view addSubview:lineView];
    
    UIImageView *dingdanImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, lineView.bottom + 15, 35, 35)];
    dingdanImgView.image = ImageNamed(@"dingdan");
    [dingdanImgView makeCornerWithCornerRadius:17.5 borderWidth:0 borderColor:nil];
    [self.view addSubview:dingdanImgView];
    
    UILabel *dingdanLabel = [[UILabel alloc] initWithFrame:CGRectMake(dingdanImgView.right + 5, self.headView.bottom + 25, 60, 15)];
    dingdanLabel.text = @"我的订单";
    dingdanLabel.textColor = [UIColor blackColor];
    dingdanLabel.font = FONT(14);
    [self.view addSubview:dingdanLabel];
    dingdanLabel.textAlignment = NSTextAlignmentLeft;
    dingdanLabel.centerY = dingdanImgView.centerY;
    
    UILabel *allLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 80, self.headView.bottom + 25, 60, 15)];
    allLabel.text = @"查看全部";
    allLabel.textColor = [UIColor blackColor];
    allLabel.font = FONT(14);
    [self.view addSubview:allLabel];
    allLabel.textAlignment = NSTextAlignmentCenter;
    allLabel.centerY = dingdanImgView.centerY;
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, dingdanImgView.bottom + 10, SCREEN_WIDTH, 1.f)];
    line1.backgroundColor = RGB(220, 220, 220);
    [self.view addSubview:line1];
    
    CGFloat currentH = line1.bottom+10;
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"待付款",@"待发/收货",@"待使用",@"待评价",@"售后", nil];
    NSArray *imgArray = [NSArray arrayWithObjects:@"daizhifu",@"shouhou",@"daishiyong",@"daipingjia",@"shouhou", nil];
    for (int i = 0; i<5; i++) {
        
        NSString *title = titleArray[i];
        NSString *imgTitle =imgArray[i];
        
        LayoutButton *button = [LayoutButton initWithLayoutButton:imgTitle title:title font:14];
        [button setImage:ImageNamed(imgTitle) forState:UIControlStateNormal];
        
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
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, currentH+10, SCREEN_WIDTH, 10.f)];
    line2.backgroundColor = kColorGray9;
    [self.view addSubview:line2];
    
    currentH = line2.bottom + 10;
    
    NSArray *titleArray1 = [NSArray arrayWithObjects:@"购物车",@"发布活动",@"消息中心",@"积分商城", nil];
    NSArray *imgArray1 = [NSArray arrayWithObjects:@"gouwuche",@"fabuhuodong",@"xiaoxizhongxin",@"jifenshangcheng", nil];
//    NSArray *imgArray1 = [NSArray arrayWithObjects:@"gouwuche",@"gouwuche",@"gouwuche",@"gouwuche", nil];

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
    
    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(0, currentH, SCREEN_WIDTH, 1.0f)];
    line3.backgroundColor = kColorGray9;
    [self.view addSubview:line3];
    
    currentH = line3.bottom + 10;
    
    NSArray *titleArray2 = [NSArray arrayWithObjects:@"优惠券",@"联系我们",@"邀请好友", nil];
    NSArray *imgArray2 = [NSArray arrayWithObjects:@"youhuiquan",@"lianxiwomen",@"yaoqinghaoyou", nil];
    for (int i = 0; i<titleArray2.count; i++) {
        
        NSString *title = titleArray2[i];
        NSString *imgTitle =imgArray2[i];
        
        LayoutButton *button = [LayoutButton initWithLayoutButton:imgTitle title:title font:13];
        [button addTarget:self action:@selector(serviceList:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 2000 + i;
        button.frame = CGRectMake(self.view.width/titleArray1.count*i, currentH, self.view.width/titleArray1.count, 70);
        
        [self.view addSubview:button];
        
        if (i == titleArray1.count - 1) {
            currentH = button.bottom;
        }
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(shareSuccess) name:kUMengShareNotification object:nil];
}

#pragma mark --监听值变化
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSString *,id> *)change
                      context:(void *)context {
    
    if ([keyPath isEqualToString:@"nickname"]) {// 昵称改变
        [self.loginBtn setTitle:[HHComlient sharedInstance].user.nickname forState:UIControlStateNormal];
    }
    if ([keyPath isEqualToString:@"face"]) {
        [self.headImgView sd_setImageWithURL:[NSURL URLWithString:[change valueForKey:@"new"]] placeholderImage:nil];
    }

    
}

#pragma mark--分享
-(void)shareEvent{
//    JTDShareContent * model = [[JTDShareContent alloc]init];
//    model.centent = @"赵万里";
//    model.name = @"万里无云";
//    model.images = @"icon";
//    [JTDShareVC shareToController:self shareModel:model shareType:PayStateShare];
}
#pragma mark--分享成功
-(void)shareSuccess{
    [self showToastHUD:@"分享成功" complete:nil];
}
#pragma mark--点击登录
-(void)loginBtnEvent:(CustomBtn *)sender{
    [self loginEvent];
}
- (void)serviceList:(UIButton *)sender{
    switch (sender.tag - 2000) {
        case 0:
//            [self shareEvent];
        {
            WebViewController *webVC = [[WebViewController alloc] init];
            webVC.urlString = MINE_BALANCE_RECHARGE;
            //    webVC.customTitle = model.title;
            webVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:webVC animated:YES];
        }
            break;
        case 1:
        {
            //联系我们
            NSString *  phoneNumber = @"010-62042201";
            NSString *callPhone = [NSString stringWithFormat:@"telprompt://%@", phoneNumber];
            /// 大于等于10.0系统使用此openURL方法
            if (@available(iOS 10.0, *)) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone] options:@{} completionHandler:nil];
            } else {
                // Fallback on earlier versions
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone]];
            }
        }
            break;
        case 2:
        {
            //消息中心
//            MessageCenterController *vc = [[MessageCenterController alloc] init];
//            vc.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
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
    if(![[HHComlient sharedInstance]isLogin]){
        [self loginEvent];
    }else{
        self.loginBtn.enabled = YES;
        SetUpViewController *vc = [[SetUpViewController alloc] init];
        JTDWeakSelf
        vc.logOutcallBack = ^{
            [WeakSelf loginState];
        };
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
    
- (void)myOrder:(UIButton *)sender{
    
}
-(void)loginState{
    if(![[HHComlient sharedInstance]isLogin]){
        self.loginBtn.enabled = YES;
        [self.loginBtn setTitle:@"点击登录" forState:UIControlStateNormal];
    }else{
        NSString * mobile = [NSString stringWithFormat:@"%@",[[HHComlient sharedInstance] user].nickname];
        [self.loginBtn setTitle:mobile forState:UIControlStateNormal];
        self.loginBtn.enabled = NO;
    }
}
-(void)loginEvent{
    [[HHAlertView alloc]initWithTitle:@"提示" message:@"这位居民您还未登录，是否先登录呢？" showTarget:self handle:^(NSInteger index) {
        switch (index) {
            case 0:
            HHLog(@"取消");
            break;
            case 1:HHLog(@"确定");
            {
                [LoginViewController showControllerWithSuccess:^{
                    [self loginState];
                } cancel:^{
                    
                }];
            }
            break;
            
            default:
            break;
        }
    } cancle:@"继续浏览" others:@"去登录吧", nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
    
    
    @end
