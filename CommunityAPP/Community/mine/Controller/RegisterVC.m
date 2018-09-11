//
//  RegisterVC.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/7.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "RegisterVC.h"
#import "RegisterView.h"
#import "RegisterRequest.h"
#import "NearCommunityController.h"
#import "NavigationViewController.h"
@interface RegisterVC ()<RegisterViewDelegate>
    
    @property (nonatomic, strong) RegisterView *registerView;
    
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
    self.title = @"注册";
    self.registerView = [[RegisterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    self.registerView.delegate = self;
    self.registerView.backgroundColor = kColorGray9;
    [self.view addSubview:_registerView];
}
#pragma mark--获取验证码
-(void)registerViewGetVFWithButton:(HHCaptchaButton *)sender phoneNum:(NSString *)phoneNum{
    if (phoneNum.length==0) {
        [self showToastHUD:@"手机号码不能为空" complete:nil ];
        return;
    }else if ([self isValiMobile:phoneNum] == NO) {
        [self showToastHUD:@"您输入的手机号码格式不正确" complete:nil ];
    }else{
        [self showHUDText:@"验证码发送中..."];
        
        RegisterRequest * request = [[RegisterRequest alloc]init];
        [request setUserRegisterCodeWith:phoneNum];
        [request setFinishedBlock:^(id object, id responseData) {
            [self hideHUD];
            NSLog(@"返回值==%@",responseData);
            sender.enabled=NO;
            [sender startTimer];
            //        tyself.model = object;
            //        [tyself fullData:tyself.model.communityArray];
            
            
        } failedBlock:^(NSInteger error, id responseData) {
            NSLog(@"%ld",error);
        }];
    }
    
    
}
#pragma mark--提交信息
-(void)registerViewDidLoginWithPhoneNum:(NSString *)phoneNum VFNum:(NSString *)VCNum password:(NSString *)password rePassword:(NSString *)repassword{
    
    if (kStringIsEmpty(phoneNum)) {
        [self showToastHUD:@"手机号不能为空" complete:nil];
        return;
    }else{
        if (![NSObject checkTelNumber:phoneNum]) {
            [self showToastHUD:@"手机号格式不正确" complete:nil];
            return;
        }
    }
    if (kStringIsEmpty(VCNum)) {
        [self showToastHUD:@"验证码不能为空" complete:nil];
        return;
    }else{
        if (VCNum.length < 4) {
            [self showToastHUD:@"验证码格式不正确" complete:nil];
            return;
        }
    }
    if (kStringIsEmpty(password)) {
        [self showToastHUD:@"密码不能为空" complete:nil];
        return;
    }else{
        if (password.length < 6) {
            [self showToastHUD:@"密码输入格式不正确" complete:nil];
            return;
        }
    }
    if (kStringIsEmpty(repassword)) {
        [self showToastHUD:@"请再次输入密码" complete:nil];
        return;
    }else{
        if (![password isEqualToString:repassword]){
            [self showToastHUD:@"两次密码输入不一致" complete:nil];
            return;
        }
    }
    RegisterRequest * request = [[RegisterRequest alloc]init];
    [request setUserRegisterWith:phoneNum code:VCNum password:password cpassword:repassword];
    [request setFinishedBlock:^(id object, id responseData) {
        JTDWeakSelf
        if(responseData){
            if([responseData[@"status"] isEqualToString:successCode]){
                [self showToastHUD:@"注册成功，请重新登录" complete:^{
                    JTDWeakSelf
                    if (WeakSelf.callback){
                        WeakSelf.callback(phoneNum, password);
                    }
                    [self.navigationController popViewControllerAnimated:YES];
                }];
            }else if([responseData[@"status"] isEqualToString:failedCode]){
                [WeakSelf showToastHUD:responseData[@"error"][@"message"] complete:nil];
            }
        }
        
        
    } failedBlock:^(NSInteger error, id responseData) {
        NSLog(@"%ld",error);
    }];
    
}
+(void)pushToRegisterViewController:(UIViewController *)controller callBack:( RegisterCallback )callback{
    RegisterVC * VC = [[RegisterVC alloc]init];
    VC.callback = callback;
    [controller.navigationController pushViewController:VC animated:YES];
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
    
    @end
