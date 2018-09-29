//
//  MyCommunityVC.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/28.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "MyCommunityVC.h"
#import "PubMyCommunityVC.h"
@interface MyCommunityVC ()

@end

@implementation MyCommunityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的小区";
    self.view.backgroundColor = kColorGray9;
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
@end
