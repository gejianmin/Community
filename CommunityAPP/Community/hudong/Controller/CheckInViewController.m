//
//  CheckInViewController.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/27.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "CheckInViewController.h"
#import "AppDelegate.h"
#import "UIButton+LXMImagePosition.h"
@interface CheckInViewController ()
@property(nonatomic,strong) AppDelegate  * app;
@property(nonatomic,strong) CustomBtn  * main_btn;
@property(nonatomic,strong) CustomBtn  * jiaoyi_btn;
@property(nonatomic,strong) CustomBtn  * hudong_btn;
@property(nonatomic,strong) UIView  * bgAlphaView;

@end

@implementation CheckInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.bgAlphaView = [[UIView alloc] initWithFrame:self.view.frame];
    self.bgAlphaView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.4f];
    [self.view addSubview:self.bgAlphaView];
    [[[[UIApplication sharedApplication] windows] lastObject] addSubview:self.bgAlphaView];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.bgAlphaView addGestureRecognizer:tap];
    
    self.main_btn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:@"" backgroundColor:RGBACOLOR(247,95,98,1) TitleTextColor:nil Font:0 Image:nil];
    [self.main_btn setImage:ImageNamed(@"around_close") forState:UIControlStateNormal];
    [self.bgAlphaView addSubview:self.main_btn];
    [self.main_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@50);
        make.right.equalTo(self.bgAlphaView.mas_right).offset(-30);
        make.bottom.equalTo(self.bgAlphaView.mas_bottom).offset(-100);
    }];
    [self.main_btn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    [self.main_btn makeCornerWithCornerRadius:24.5 borderWidth:0 borderColor:nil];
    self.hudong_btn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:@"互动一下" backgroundColor:kColorClear TitleTextColor:kColorWhite Font:14.0 Image:nil];
    [self.bgAlphaView addSubview:self.hudong_btn];
    [self.hudong_btn setImage:ImageNamed(@"around_creatgroup") forState:UIControlStateNormal];
    [self.hudong_btn setImagePosition:LXMImagePositionRight spacing:8];
    [self.hudong_btn addTarget:self action:@selector(jiaoyiEvent:) forControlEvents:UIControlEventTouchUpInside];
    self.hudong_btn.tag = hudongType;
    [self.hudong_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
        make.width.height.equalTo(@120);
        make.right.equalTo(self.bgAlphaView.mas_right).offset(-30);
        make.bottom.equalTo(self.main_btn.mas_top).offset(-20);
    }];
    
    self.jiaoyi_btn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:@"交易一下" backgroundColor:kColorClear TitleTextColor:kColorWhite Font:15.0 Image:nil];
    [self.bgAlphaView addSubview:self.jiaoyi_btn];
    [self.jiaoyi_btn setImage:ImageNamed(@"around_travle") forState:UIControlStateNormal];
    [self.jiaoyi_btn setImagePosition:LXMImagePositionRight spacing:8];
    self.jiaoyi_btn.tag = jiaoyiType;
    [self.jiaoyi_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
        make.width.equalTo(@120);
        make.right.equalTo(self.bgAlphaView.mas_right).offset(-30);
        make.bottom.equalTo(self.hudong_btn.mas_top).offset(-20);
    }];
    [self.jiaoyi_btn addTarget:self action:@selector(jiaoyiEvent:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)jiaoyiEvent:(CustomBtn *)sender{
    [self.bgAlphaView removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.callBack) {
            self.callBack(sender.tag);
        }
    }];    
}
-(void)tap:(UITapGestureRecognizer *)tap{
    [self.bgAlphaView removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:nil];
}
+(void)presentControllerWith:(UIViewController *)superController callBack:(callBack )callBack{
    CheckInViewController * vc = [[CheckInViewController alloc]init];
    vc.definesPresentationContext = YES;
    vc.providesPresentationContextTransitionStyle = YES;
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    vc.callBack = callBack;
    [superController presentViewController:vc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
