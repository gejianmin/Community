//
//  SetUpNickNameVC.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/10/9.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SetUpNickNameVC.h"
#import "SaveNickNameRequest.h"

@interface SetUpNickNameVC ()
@property (weak, nonatomic) IBOutlet UITextField *nickNameTF;

@end

@implementation SetUpNickNameVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"nav_cacel"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backButtonClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveBtnClick:(UIButton *)sender {
    
    if (self.nickNameTF.text.length != 0) {
        //参数
        SaveNickNameRequest *request = [[SaveNickNameRequest alloc]init];
        [request saveNickName:self.nickNameTF.text];
        [request setFinishedBlock:^(id object, id responseData) {
           
            HHLog(@"请求成功 = %@",responseData);
            [HHComlient sharedInstance].user.nickname = self.nickNameTF.text;
        } failedBlock:^(NSInteger error, id responseData) {
            
        }];
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"修改昵称";
    
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
