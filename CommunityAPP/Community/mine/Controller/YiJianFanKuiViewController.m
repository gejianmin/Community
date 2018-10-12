//
//  YiJianFanKuiViewController.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/10/11.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "YiJianFanKuiViewController.h"
#import "SYSelector.h"
#import "TiYanWenTiViewController.h"
#import "TouSuViewController.h"
@interface YiJianFanKuiViewController ()

@property(nonatomic, strong) SYSelector *selectV;
@end

@implementation YiJianFanKuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
    [self.view addSubview:self.selectV];
    
}

-(SYSelector *)selectV {
    if (!_selectV) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SetUp" bundle:nil];
        TiYanWenTiViewController *tiwenVC = [sb instantiateViewControllerWithIdentifier:@"tiyanwenti"];
        tiwenVC.view.backgroundColor = kColorGray9;
        TouSuViewController *tousu = [sb instantiateViewControllerWithIdentifier:@"tousu"];
        NSArray *childrens = @[tiwenVC,tousu];
        _selectV = [[SYSelector alloc]initWithFatherVC:self childrensVC:childrens frame:CGRectMake(0, 0, HH_SCREEN_W, 40)];

    }
    return _selectV;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
