//
//  RegisterVC.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/7.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "RegisterVC.h"
#import "ForgotView.h"
@interface RegisterVC ()

@property (nonatomic, strong) ForgotView *forgotView;

@end

@implementation RegisterVC
-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = NO;
}
-(void)viewDidDisappear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.forgotView = [[ForgotView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    [self.view addSubview:_forgotView];
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
